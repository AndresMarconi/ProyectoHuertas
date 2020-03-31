Class {
	#name : #InventoryItem,
	#superclass : #GAFObject,
	#instVars : [
		'substance',
		'unit',
		'records'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
InventoryItem class >> isVoyageRoot [
	^ true
]

{ #category : #adding }
InventoryItem >> addRecord: aRecord [
	records add: aRecord
]

{ #category : #initialization }
InventoryItem >> initialize [ 
	super initialize.
	records:= OrderedCollection new.
]

{ #category : #accessing }
InventoryItem >> records [
	^ records
]

{ #category : #accessing }
InventoryItem >> substance [
	^ substance
]

{ #category : #accessing }
InventoryItem >> substance: anObject [
	substance := anObject
]

{ #category : #accessing }
InventoryItem >> unit [
	^ unit
]

{ #category : #accessing }
InventoryItem >> unit: anObject [
	unit := anObject
]
