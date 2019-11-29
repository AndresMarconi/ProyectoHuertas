Class {
	#name : #FOMStockComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMStockComponent >> editElement: element [
	(self call: (PurchaseEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMStockComponent >> elements [
	^ (Purchase selectAll) asSortedCollection: [ :a :b | a date > b date ]
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
	self listTempleteOn: html
]
