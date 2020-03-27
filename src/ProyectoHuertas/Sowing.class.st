Class {
	#name : #Sowing,
	#superclass : #Event,
	#instVars : [
		'quantity',
		'crop',
		'cultivarName',
		'timeToHarvest',
		'harvestDuration',
		'expectedYield'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'as yet unclassified' }
Sowing class >> date: aDate time: aTime plot: aPlot crop: aCrop quantity: aQuantity timeToHarvest: aTTH harvestDuration: aHD expectedYield: aEY [
	^ self new
		date: aDate;
		time: aTime;
		crop: aCrop;
		quantity: aQuantity;
		plot: aPlot;
		timeToHarvest: aTTH;
		harvestDuration: aHD;
		expectedYield: aEY;
		yourself
]

{ #category : #testing }
Sowing class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Sowing class >> typeDescriptor [
	^ 'Siembra'
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
Sowing >> expectedYield [
	^ expectedYield
]

{ #category : #accessing }
Sowing >> expectedYield: anObject [
	expectedYield := anObject
]

{ #category : #'as yet unclassified' }
Sowing >> harvestDate [
	^ self date addDays: timeToHarvest.
]

{ #category : #accessing }
Sowing >> harvestDuration [
	^ harvestDuration
]

{ #category : #accessing }
Sowing >> harvestDuration: anObject [
	harvestDuration := anObject
]

{ #category : #'as yet unclassified' }
Sowing >> harvestPeriod [
	^ self harvestDate addDays: harvestDuration.
]

{ #category : #copying }
Sowing >> postCopy [
	super postCopy.
	quantity := quantity copy.
	^ self
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
