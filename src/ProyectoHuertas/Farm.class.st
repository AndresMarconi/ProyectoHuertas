Class {
	#name : #Farm,
	#superclass : #FOMObject,
	#instVars : [
		'name',
		'plots',
		'inventory'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Farm class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Farm class >> name: aName [
	^ self new
		name: aName;
		yourself
]

{ #category : #accessing }
Farm >> addInventory: anObject [
	inventory add: anObject
]

{ #category : #accessing }
Farm >> addPlot: anObject [
	plots add: anObject
]

{ #category : #archiving }
Farm >> archive [
	super archive.
	plots do: #archive.
	inventory do: #archive
]

{ #category : #'as yet unclassified' }
Farm >> emptyInventory [
	inventory := OrderedCollection new
]

{ #category : #accessing }
Farm >> events [ 
	^ ((self plots) flatCollect: [ :plot | plot events ]) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #initialization }
Farm >> initialize [
	super initialize.
	plots := OrderedCollection new.
	inventory := OrderedCollection new
]

{ #category : #accessing }
Farm >> inventory [
	^ inventory reject: [ :inventoryItem | inventoryItem archived ]
]

{ #category : #accessing }
Farm >> name [
	^ name
]

{ #category : #accessing }
Farm >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Farm >> plots [
	^ plots reject: [ :plot | plot archived ]
]

{ #category : #accessing }
Farm >> updateStockOf: substance with: quantity expiringOn: aDate [
	inventory
		add:
			(SubstanceStock
				substance: substance
				quantity: quantity
				expirationDate: aDate)
]
