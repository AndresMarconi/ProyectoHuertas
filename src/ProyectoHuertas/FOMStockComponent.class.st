Class {
	#name : #FOMStockComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMStockComponent >> addSubstanceStock [
	| substanceStock |
	substanceStock := self call: (SubstanceStockEditor subject: SubstanceStock new).
	substanceStock ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMStockComponent >> editElement: element [
	(self call: (PurchaseEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMStockComponent >> elements [
	^ (SubstanceStock selectAll) asSortedCollection: [ :a :b | a expirationDate > b expirationDate ]
]

{ #category : #rendering }
FOMStockComponent >> heading [ 
	^ 'Stock'
]

{ #category : #printing }
FOMStockComponent >> printOn: aStream [
	aStream nextPutAll: 'Depósito'
]

{ #category : #rendering }
FOMStockComponent >> renderContentOn: html [
	self listTempleteOn: html.
	html anchor
		callback: [ self addSubstanceStock ];
		with: [ html formButton bePrimary;
						with: 'Agregar Substancia al deposito' ]
]
