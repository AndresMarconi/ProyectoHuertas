Class {
	#name : #Farm,
	#superclass : #Object,
	#instVars : [
		'name',
		'plots',
		'campaings',
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
Farm >> addCampaings: anObject [
	campaings add: anObject
]

{ #category : #accessing }
Farm >> addPlot: anObject [
	plots add: anObject
]

{ #category : #accessing }
Farm >> campaings [
	^ campaings
]

{ #category : #initialization }
Farm >> initialize [
	campaings := OrderedCollection new.
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
	^ plots
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
