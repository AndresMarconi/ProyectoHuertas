Class {
	#name : #InventoryItemRecord,
	#superclass : #GafObject,
	#instVars : [
		'source',
		'quantity',
		'expirationDate'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #accessing }
InventoryItemRecord >> expirationDate [
	^ expirationDate
]

{ #category : #accessing }
InventoryItemRecord >> expirationDate: anObject [
	expirationDate := anObject
]

{ #category : #accessing }
InventoryItemRecord >> quantity [
	^ quantity
]

{ #category : #accessing }
InventoryItemRecord >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
InventoryItemRecord >> source [
	^ source
]

{ #category : #accessing }
InventoryItemRecord >> source: anObject [
	source := anObject
]
