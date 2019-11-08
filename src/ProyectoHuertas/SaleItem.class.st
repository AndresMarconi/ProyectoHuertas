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
