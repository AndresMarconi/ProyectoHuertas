Class {
	#name : #InventoryItem,
	#superclass : #FOMObject,
	#instVars : [
		'substance',
		'quantity',
		'expirationDate'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
InventoryItem class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
InventoryItem class >> substance: substance quantity: quantity expirationDate: date [
	^ self new
		substance: substance;
		quantity: quantity;
		expirationDate: date;
		yourself
]

{ #category : #accessing }
InventoryItem >> expirationDate [
	^ expirationDate
]

{ #category : #accessing }
InventoryItem >> expirationDate: anObject [
	expirationDate := anObject
]

{ #category : #accessing }
InventoryItem >> quantity [
	^ quantity
]

{ #category : #accessing }
InventoryItem >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
InventoryItem >> substance [
	^ substance
]

{ #category : #accessing }
InventoryItem >> substance: anObject [
	substance := anObject
]
