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

{ #category : #adding }
Cultivar >> addIngredient: anIngredient [
	whiteList add: anIngredient
]

{ #category : #initialization }
Cultivar >> initialize [ 
	whiteList := OrderedCollection new
]

{ #category : #printing }
Cultivar >> printOn: aStream [
	^ aStream
		nextPutAll: (self name).
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
