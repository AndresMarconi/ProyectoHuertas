Class {
	#name : #InventoryItem,
	#superclass : #FOMObject,
	#instVars : [
		'substance',
		'activeIngredient',
		'quantity',
		'expiration'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
InventoryItem class >> isVoyageRoot [
	^ true
]

{ #category : #'as yet unclassified' }
InventoryItem class >> substance: aSubstance activeIngredient: anActiveIngredient quantity: aQuantity expiration: anExpiration [
	^ self new 
		substance: aSubstance;
		activeIngredient: anActiveIngredient;
		quantity: aQuantity;
		expiration: anExpiration;
		yourself
]

{ #category : #accessing }
InventoryItem >> activeIngredient [
	^ activeIngredient
]

{ #category : #accessing }
InventoryItem >> activeIngredient: anObject [
	activeIngredient := anObject
]

{ #category : #accessing }
InventoryItem >> expiration [
	^ expiration
]

{ #category : #accessing }
InventoryItem >> expiration: anObject [
	expiration := anObject
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
