Class {
	#name : #Crop,
	#superclass : #GAFObject,
	#instVars : [
		'vulgarName',
		'optimalYieldPerPlant'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Crop class >> isVoyageRoot [
	^ true
]

{ #category : #'as yet unclassified' }
Crop class >> name: aName yield: aYield [
	^ self new
		vulgarName: aName;
		optimalYieldPerPlant: 0;
		yourself
]

{ #category : #initialization }
Crop >> initialize [
	super initialize.
	optimalYieldPerPlant := 0
]

{ #category : #accessing }
Crop >> optimalYieldPerPlant [
	^ optimalYieldPerPlant
]

{ #category : #accessing }
Crop >> optimalYieldPerPlant: aMeasurement [
	optimalYieldPerPlant := aMeasurement
]

{ #category : #printing }
Crop >> printOn: aStream [
	^ aStream
		nextPutAll: (self vulgarName).
]

{ #category : #accessing }
Crop >> vulgarName [
	^ vulgarName
]

{ #category : #accessing }
Crop >> vulgarName: anObject [
	vulgarName := anObject
]
