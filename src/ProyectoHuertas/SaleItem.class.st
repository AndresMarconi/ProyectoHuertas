Class {
	#name : #SaleItem,
	#superclass : #Object,
	#instVars : [
		'kg',
		'plot',
		'product'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
SaleItem class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
SaleItem class >> newWithProduct: aProduct Kg: kg Plot: aPlot [
	| saleItem |
	saleItem := self new.
	^ saleItem 
		product: aProduct;
		kg: kg;
		plot: aPlot 
]

{ #category : #accessing }
SaleItem >> kg [
	^ kg
]

{ #category : #accessing }
SaleItem >> kg: anObject [
	kg := anObject
]

{ #category : #accessing }
SaleItem >> plot [
	^ plot
]

{ #category : #accessing }
SaleItem >> plot: anObject [
	plot := anObject
]

{ #category : #accessing }
SaleItem >> product [
	^ product
]

{ #category : #accessing }
SaleItem >> product: anObject [
	product := anObject
]
