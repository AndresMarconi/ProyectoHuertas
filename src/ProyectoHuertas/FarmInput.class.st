Class {
	#name : #FarmInput,
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
FarmInput class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
FarmInput class >> product: aProduct brand: aBrand container: aContainer expires: aDate quantity: aQuantity [
	^ self new
		product: aProduct;
		brand: aBrand;
		container: aContainer;
		expires: aDate;
		quantity: aQuantity;
		yourself
]

{ #category : #accessing }
FarmInput >> brand [
	^ brand
]

{ #category : #accessing }
FarmInput >> brand: anObject [
	brand := anObject
]

{ #category : #accessing }
FarmInput >> container [
	^ container
]

{ #category : #accessing }
FarmInput >> container: anObject [
	container := anObject
]

{ #category : #accessing }
FarmInput >> expires [
	^ expires
]

{ #category : #accessing }
FarmInput >> expires: anObject [
	expires := anObject
]

{ #category : #accessing }
FarmInput >> product [
	^ product
]

{ #category : #accessing }
FarmInput >> product: anObject [
	product := anObject
]

{ #category : #accessing }
FarmInput >> quantity [
	^ quantity
]

{ #category : #accessing }
FarmInput >> quantity: anObject [
	quantity := anObject
]
