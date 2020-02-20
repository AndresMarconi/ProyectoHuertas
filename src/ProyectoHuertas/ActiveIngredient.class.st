Class {
	#name : #ActiveIngredient,
	#superclass : #FOMObject,
	#instVars : [
		'ingredient'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #accessing }
ActiveIngredient >> ingredient [
	^ ingredient
]

{ #category : #accessing }
ActiveIngredient >> ingredient: anObject [
	ingredient := anObject
]
