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

{ #category : #testing }
SaleItem class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
SaleItem class >> product: aProduct kilograms: kg fromPlot: aPlot [
	^ self new
		product: aProduct;
		kg: kg;
		plot: aPlot;
		archived: true;
		yourself
]

{ #category : #'submorphs-add/remove' }
SaleItem >> delete [ 
	archived:= false.
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
