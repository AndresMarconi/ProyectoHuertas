Class {
	#name : #InventoryItemMovement,
	#superclass : #GafObject,
	#instVars : [
		'date',
		'quantity',
		'reason'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #accessing }
InventoryItemMovement >> date [
	^ date asDate
]

{ #category : #accessing }
InventoryItemMovement >> date: anObject [
	date := anObject
]

{ #category : #accessing }
InventoryItemMovement >> quantity [
	^ quantity
]

{ #category : #accessing }
InventoryItemMovement >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
InventoryItemMovement >> reason [
	^ reason
]

{ #category : #accessing }
InventoryItemMovement >> reason: anObject [
	reason := anObject
]
