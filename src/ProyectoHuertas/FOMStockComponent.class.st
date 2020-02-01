Class {
	#name : #FOMStockComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMStockComponent >> addSubstanceStock [
	| substanceStock |
	substanceStock := self call: (SubstanceStockEditor subject: SubstanceStock new).
	substanceStock ifNotNil: [ :it | 
		it save.
		self session user addStock: it.
		self session user save  ]
]

{ #category : #rendering }
FOMStockComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Marca' . 'Cantidad disponible'.
	'Fecha de expiración'}
]

{ #category : #rendering }
FOMStockComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance brand.
	element quantity.
	element expirationDate ddmmyyyy}
]

{ #category : #callbacks }
FOMStockComponent >> editElement: element [
	(self call: (PurchaseEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMStockComponent >> elements [
	^ (self session stock) asSortedCollection: [ :a :b | a expirationDate > b expirationDate ]
]

{ #category : #printing }
FOMStockComponent >> printOn: aStream [
	aStream nextPutAll: 'Depósito'
]

{ #category : #rendering }
FOMStockComponent >> renderContentOn: html [
	super renderContentOn: html.
	html break.
	html anchor
		callback: [ self addSubstanceStock ];
		with: [ html formButton
				bePrimary;
				with: 'Agregar Substancia al deposito' ]
]
