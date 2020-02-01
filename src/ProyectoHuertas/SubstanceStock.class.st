Class {
	#name : #SubstanceStock,
	#superclass : #FOMObject,
	#instVars : [
		'substance',
		'quantity',
		'expirationDate'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
SubstanceStock class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
SubstanceStock class >> substance: substance quantity: quantity expirationDate: date [
	^ self new
		substance: substance;
		quantity: quantity;
		expirationDate: date;
		yourself
]

{ #category : #accessing }
SubstanceStock >> expirationDate [
	^ expirationDate
]

{ #category : #accessing }
SubstanceStock >> expirationDate: anObject [
	expirationDate := anObject
]

{ #category : #accessing }
SubstanceStock >> quantity [
	^ quantity
]

{ #category : #accessing }
SubstanceStock >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
SubstanceStock >> substance [
	^ substance
]

{ #category : #accessing }
SubstanceStock >> substance: anObject [
	substance := anObject
]
