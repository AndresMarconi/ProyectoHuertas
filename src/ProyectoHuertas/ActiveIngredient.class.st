Class {
	#name : #ActiveIngredient,
	#superclass : #FOMObject,
	#instVars : [
		'ingredient'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'as yet unclassified' }
ActiveIngredient class >> ingredient: aIngredient [
	^ self new
		ingredient: aIngredient;
		yourself    
]

{ #category : #testing }
ActiveIngredient class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
ActiveIngredient >> ingredient [
	^ ingredient
]

{ #category : #accessing }
ActiveIngredient >> ingredient: anObject [
	ingredient := anObject
]
