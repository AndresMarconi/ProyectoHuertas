Class {
	#name : #Cultivar,
	#superclass : #FOMObject,
	#instVars : [
		'vulgarName',
		'yield',
		'whiteList'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Cultivar class >> isVoyageRoot [
	^ true
]

{ #category : #'as yet unclassified' }
Cultivar class >> name: aName yield: aYield [
	^ self new
		vulgarName: aName;
		yield: 0;
		yourself
]

{ #category : #adding }
Cultivar >> addIngredient: anIngredient [
	whiteList add: anIngredient
]

{ #category : #initialization }
Cultivar >> initialize [ 
	super initialize.
	whiteList := OrderedCollection new
]

{ #category : #printing }
Cultivar >> printOn: aStream [
	^ aStream
		nextPutAll: (self vulgarName).
]

{ #category : #accessing }
Cultivar >> vulgarName [
	^ vulgarName
]

{ #category : #accessing }
Cultivar >> vulgarName: anObject [
	vulgarName := anObject
]

{ #category : #adding }
Cultivar >> whiteList [
	^ whiteList
]

{ #category : #accessing }
Cultivar >> yield [
	^ yield
]

{ #category : #accessing }
Cultivar >> yield: anObject [
	yield := anObject
]
