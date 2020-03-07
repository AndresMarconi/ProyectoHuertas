Class {
	#name : #ActiveIngredient,
	#superclass : #FOMObject,
	#instVars : [
		'tradeName',
		'referenceUrl'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
ActiveIngredient class >> isVoyageRoot [
	^ true
]

{ #category : #printing }
ActiveIngredient >> printOn: aStream [
	^ aStream
		nextPutAll: (self tradeName).
]

{ #category : #accessing }
ActiveIngredient >> referenceUrl [
	^ referenceUrl
]

{ #category : #accessing }
ActiveIngredient >> referenceUrl: anObject [
	referenceUrl := anObject
]

{ #category : #accessing }
ActiveIngredient >> tradeName [
	^ tradeName
]

{ #category : #accessing }
ActiveIngredient >> tradeName: anObject [
	tradeName := anObject
]
