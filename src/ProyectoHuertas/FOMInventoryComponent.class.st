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

{ #category : #rendering }
FOMInventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Marca' . 'Cantidad disponible'.
	'Fecha de expiración'}
]

{ #category : #rendering }
FOMInventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance brand.
	element quantity.
	element expirationDate ddmmyyyy}
]

{ #category : #callbacks }
FOMInventoryComponent >> editElement: element [
	(self call: (PurchaseEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMInventoryComponent >> elements [
	^ selectedList
]

{ #category : #initialization }
FOMInventoryComponent >> initialize [
	selectedList:= {}.
	fertilizerList:= ((self session user) inventory) select: [ :each| each substanceType = 'fertilize' ].
	pesticidesList:= ((self session user) inventory) select: [ :each| each substanceType = 'pesticide' ].
	super initialize.
]

{ #category : #printing }
FOMInventoryComponent >> printOn: aStream [
	aStream nextPutAll: 'Inventario'
]

{ #category : #rendering }
FOMInventoryComponent >> renderContentOn: html [
	self renderListSelectorOn: html.
	selectedList ifNil: [ html text: 'seleccione un tipo de susbtacia' ]
	ifNotNil: [ super renderContentOn: html ]
	
]

{ #category : #rendering }
FOMInventoryComponent >> renderListSelectorOn: html [
	html navigation: [
		html navigationLink
			beDisabledIf: [ selectedList == fertilizerList ];
			callback: [ selectedList := fertilizerList];
			with: 'Fertilizante'. 
		html navigationLink
			beDisabledIf: [ selectedList == pesticidesList ];
			callback: [ selectedList := pesticidesList ];
			with: 'pesticidas'. ]
]
