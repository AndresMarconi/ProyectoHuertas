Class {
	#name : #ActiveIngredient,
	#superclass : #FOMObject,
	#instVars : [
		'tradeName',
		'referenceUrl'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'as yet unclassified' }
ActiveIngredient class >> ingredient: aIngredient [
	^ self new
		ingredient: aIngredient;
		yourself    
]

{ #category : #'as yet unclassified' }
ActiveIngredient class >> ingredient: aIngredient URL: anUrl [
	^ self new
		tradeName: aIngredient;
		referenceUrl: anUrl;
		yourself    
]

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
