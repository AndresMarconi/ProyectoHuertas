Class {
	#name : #SaleItem,
	#superclass : #FOMObject,
	#instVars : [
		'kilograms',
		'plot',
		'product'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
SaleItem class >> product: aProduct kilograms: kg fromPlot: aPlot [
	^ self new
		product: aProduct;
		kilograms: kg;
		plot: aPlot;
		yourself
]

{ #category : #accessing }
SaleItem >> kilograms [
	^ kilograms
]

{ #category : #accessing }
SaleItem >> kilograms: anObject [
	kilograms := anObject
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
