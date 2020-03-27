Class {
	#name : #Harvesting,
	#superclass : #Event,
	#instVars : [
		'quantity',
		'crop',
		'cultivarName',
		'otherUnit'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'as yet unclassified' }
Harvesting class >> date: aDate time: aTime plot: aPlot crop: aCrop quantity: aQuantity [
	^ self new
		date: aDate;
		time: aTime;
		crop: aCrop;
		quantity: aQuantity;
		plot: aPlot;
		yourself
]

{ #category : #testing }
Harvesting class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Harvesting class >> typeDescriptor [
	^ 'Cosecha'
]

{ #category : #accessing }
Harvesting >> crop [
	^ crop
]

{ #category : #accessing }
Harvesting >> crop: anObject [
	crop := anObject
]

{ #category : #accessing }
Harvesting >> cultivarName [
	^ cultivarName
]

{ #category : #accessing }
Harvesting >> cultivarName: anObject [
	cultivarName := anObject
]

{ #category : #testing }
Harvesting >> isEvent: aName [
	^ aName = 'harvest'
]

{ #category : #accessing }
Harvesting >> otherUnit [
	^ otherUnit
]

{ #category : #accessing }
Harvesting >> otherUnit: anObject [
	otherUnit := anObject
]

{ #category : #copying }
Harvesting >> postCopy [
	super postCopy.
	quantity := quantity copy.
	otherUnit := otherUnit copy.
	^ self
]

{ #category : #accessing }
Harvesting >> quantity [
	^ quantity
]

{ #category : #accessing }
Harvesting >> quantity: anObject [
	quantity := anObject
]

{ #category : #printing }
Harvesting >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForHarvesting: self
]
