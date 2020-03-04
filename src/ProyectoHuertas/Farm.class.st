Class {
	#name : #Farm,
	#superclass : #FOMObject,
	#instVars : [
		'name',
		'plots',
		'inventoryItems',
		'sales'
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
Farm >> addInventoryItem: anObject [
	inventoryItems add: anObject
]

{ #category : #accessing }
Farm >> addPlot: anObject [
	plots add: anObject
]

{ #category : #accessing }
Farm >> addSale: anObject [
	plots add: anObject
]

{ #category : #archiving }
Farm >> archive [
	super archive.
	plots do: #archive.
	inventoryItems do: #archive
]

{ #category : #utility }
Farm >> emptyInventory [
	inventoryItems := OrderedCollection new
]

{ #category : #accessing }
Farm >> events [ 
	^ ((self plots) flatCollect: [ :plot | plot events ]) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #initialization }
Farm >> initialize [
	super initialize.
	plots := OrderedCollection new.
	inventoryItems := OrderedCollection new.
	sales := OrderedCollection new
]

{ #category : #accessing }
Farm >> inventory [
	^ inventoryItems reject: [ :inventoryItem | inventoryItem archived ]
]

{ #category : #accessing }
Farm >> inventoryItems [
	^ inventoryItems reject: [ :inventoryItem | inventoryItem archived ]
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
Farm >> sales [
	^ sales
]

{ #category : #accessing }
Farm >> updateStockOf: substance with: quantity expiringOn: aDate [
	inventoryItems
		add:
			(InventoryItem
				substance: substance
				quantity: quantity
				expirationDate: aDate)
]
