Class {
	#name : #Input,
	#superclass : #Object,
	#instVars : [
		'product',
		'brand',
		'container',
		'quantity',
		'expires'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Input class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Input class >> newWithProduct: aProduct Brand: aBrand Container: aContainer Expires: aDate Quantity: aQuantity [
	| input |
	input := self new.
	^ input
		product: aProduct;
		brand: aBrand;
		container: aContainer;
		expires: aDate;
		quantity: aQuantity
]

{ #category : #accessing }
Input >> brand [
	^ brand
]

{ #category : #accessing }
Input >> brand: anObject [
	brand := anObject
]

{ #category : #accessing }
Input >> container [
	^ container
]

{ #category : #accessing }
Input >> container: anObject [
	container := anObject
]

{ #category : #accessing }
Input >> expires [
	^ expires
]

{ #category : #accessing }
Input >> expires: anObject [
	expires := anObject
]

{ #category : #accessing }
Input >> product [
	^ product
]

{ #category : #accessing }
Input >> product: anObject [
	product := anObject
]

{ #category : #accessing }
Input >> quantity [
	^ quantity
]

{ #category : #accessing }
Input >> quantity: anObject [
	quantity := anObject
]
