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

{ #category : #testing }
Harvesting class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Harvesting class >> typeDescriptor [
	^ 'Cosecha'
]

{ #category : #'instance creation' }
Harvesting class >> variety: aVariety quantity: aQuantity date: aDate [
	^ self new
		quantity: aQuantity;
		variety: aVariety;
		date: aDate;
		yourself
]

{ #category : #'instance creation' }
Harvesting class >> variety: aVariety quantity: aQuantity date: aDate otherUnit: aUnit [
	^ self new
		quantity: aQuantity;
		variety: aVariety;
		date: aDate;
		otherUnit: aUnit;
		yourself
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
