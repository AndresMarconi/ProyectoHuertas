Class {
	#name : #FOMSalesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMSalesComponent >> addSale [
	| sale |
	sale := self call: (SaleEditor subject: Sale new).
	sale ifNotNil: [ :it | 
		it save. 
		self session user addSale: it.
		self session user save ]
]

{ #category : #callbacks }
FOMSalesComponent >> editElement: element [
	| sale |
	sale := self call: (SaleEditor subject: element).
	sale ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMSalesComponent >> elements [
	^ (self session sales) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #callbacks }
FOMSalesComponent >> heading [ 
	^ 'Ventas'
]

{ #category : #printing }
FOMSalesComponent >> printOn: aStream [
	aStream nextPutAll: 'Ventas'
]

{ #category : #rendering }
FOMSalesComponent >> renderContentOn: html [
	self listTempleteOn: html.
	html anchor
		callback: [ self addSale ];
		with: [ html formButton bePrimary;
						with: 'Agregar venta' ]
]
