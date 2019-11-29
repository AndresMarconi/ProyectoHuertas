Class {
	#name : #FOMSalesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMSalesComponent >> editElement: element [
]

{ #category : #callbacks }
FOMSalesComponent >> elements [
	^ (Sale selectAll) asSortedCollection: [ :a :b | a date > b date ]
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
	self listTempleteOn: html
]
