Class {
	#name : #Sowing,
	#superclass : #Event,
	#instVars : [
		'conductionSystem',
		'quantity',
		'distribution',
		'crop',
		'cultivarName',
		'timeToHarvest',
		'harvestDuration',
		'expectedYield'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Sowing class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Sowing class >> typeDescriptor [
	^ 'Siembra'
]

{ #category : #accessing }
Sowing >> conductionSystem [
	^ conductionSystem
]

{ #category : #accessing }
Sowing >> conductionSystem: anObject [
	conductionSystem := anObject
]

{ #category : #accessing }
Sowing >> crop [
	^ crop
]

{ #category : #accessing }
Sowing >> crop: anObject [
	crop := anObject
]

{ #category : #accessing }
Sowing >> cultivarName [
	^ cultivarName
]

{ #category : #accessing }
Sowing >> cultivarName: anObject [
	cultivarName := anObject
]

{ #category : #accessing }
Sowing >> distribution [
	^ distribution
]

{ #category : #accessing }
Sowing >> distribution: anObject [
	distribution := anObject
]

{ #category : #accessing }
Sowing >> expectedYield [
	^ expectedYield
]

{ #category : #accessing }
Sowing >> expectedYield: anObject [
	expectedYield := anObject
]

{ #category : #accessing }
Sowing >> harvestDuration [
	^ harvestDuration
]

{ #category : #accessing }
Sowing >> harvestDuration: anObject [
	harvestDuration := anObject
]

{ #category : #accessing }
Sowing >> quantity [
	^ quantity
]

{ #category : #accessing }
Sowing >> quantity: anObject [
	quantity := anObject
]

{ #category : #printing }
Sowing >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForSowing: self
]

{ #category : #accessing }
Sowing >> timeToHarvest [
	^ timeToHarvest
]

{ #category : #accessing }
Sowing >> timeToHarvest: anObject [
	timeToHarvest := anObject
]
