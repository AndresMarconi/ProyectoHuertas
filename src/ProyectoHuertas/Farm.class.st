Class {
	#name : #Farm,
	#superclass : #FOMObject,
	#instVars : [
		'name',
		'plots',
		'substanceStock'
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
Farm >> addPlot: anObject [
	plots add: anObject
]

{ #category : #archiving }
Farm >> archive [
	super archive.
	plots do: #archive.
	substanceStock do: #archive
]

{ #category : #initialization }
Farm >> initialize [
	super initialize.
	plots := OrderedCollection new.
	substanceStock := OrderedCollection new
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
	substanceStock
		add:
			(SubstanceStock
				substance: substance
				quantity: quantity
				expirationDate: aDate)
]
