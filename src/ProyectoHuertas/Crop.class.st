Class {
	#name : #Crop,
	#superclass : #FOMObject,
	#instVars : [
		'vulgarName',
		'optimalYield'
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
		optimalYield: 0;
		yourself
]

{ #category : #initialization }
Crop >> initialize [
	super initialize.
	optimalYield := 0
]

{ #category : #accessing }
Crop >> optimalYield [
	^ optimalYield
]

{ #category : #accessing }
Crop >> optimalYield: anObject [
	optimalYield := anObject
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
