Class {
	#name : #FOMInventoryComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'selectedList',
		'fertilizerList',
		'pesticidesList'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMInventoryComponent >> addSubstanceStock [
	| substanceStock |
	substanceStock := self call: (SubstanceStockEditor subject: SubstanceStock new).
	substanceStock ifNotNil: [ :it | 
		it save.
		self session farm addInventory: it.
		self session farm save.
		self initializeLists ]
]

{ #category : #rendering }
FOMInventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Principio Activo' . 'Cantidad disponible'}
]

{ #category : #rendering }
FOMInventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance activeIngredients.
	element quantity}
]

{ #category : #callbacks }
FOMInventoryComponent >> editElement: element [
	(self call: (SubstanceStockEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMInventoryComponent >> elements [
	^ selectedList
]

{ #category : #initialization }
FOMInventoryComponent >> initialize [
	selectedList:= {}.
	self initializeLists.
	super initialize.
]

{ #category : #initialization }
FOMInventoryComponent >> initializeLists [
	
	fertilizerList:= ((self session farm) inventory) select: [ :each| (each substance) type = 'Fertilizante' ].
	pesticidesList:= ((self session farm) inventory) select: [ :each| (each substance) type = 'Pesticida' ].

]

{ #category : #printing }
FOMInventoryComponent >> printOn: aStream [
	aStream nextPutAll: 'Inventario'
]

{ #category : #rendering }
FOMInventoryComponent >> renderContentOn: html [
	self renderListSelectorOn: html.
	selectedList ifEmpty: [ html text: 'seleccione un tipo de susbtacia'. html break ]
	ifNotEmpty: [ super renderContentOn: html ].
	html anchor
		callback: [ self addSubstanceStock ];
		with: [ html formButton
				bePrimary;
				with: 'Agregar Substancia al deposito' ]
	
]

{ #category : #rendering }
FOMInventoryComponent >> renderListSelectorOn: html [
	html navigation: [
		html navigationLink
			beDisabledIf: [ selectedList == fertilizerList ];
			callback: [ selectedList := fertilizerList];
			with: 'Fertilizantes'. 
		html navigationLink
			beDisabledIf: [ selectedList == pesticidesList ];
			callback: [ selectedList := pesticidesList ];
			with: 'Pesticidas'. ]
]
