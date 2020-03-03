Class {
	#name : #Substance,
	#superclass : #FOMObject,
	#instVars : [
		'comercialName',
		'activeIngredients',
		'type'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
Substance class >> comercialName: comercialName brand: brand activeIngredients: activeIngredients waitingPeriodAfterApplication: waitingPeriodAfterApplication [
	^ self new
		comercialName: comercialName;
		brand: brand;
		activeIngredients: activeIngredients;
		waitingPeriodAfterApplication: waitingPeriodAfterApplication;
		yourself
]

{ #category : #'instance creation' }
Substance class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Substance >> activeIngredients [
	^ activeIngredients
]

{ #category : #accessing }
Substance >> activeIngredients: anObject [
	activeIngredients := anObject
]

{ #category : #accessing }
Substance >> comercialName [
	^ comercialName
]

{ #category : #accessing }
Substance >> comercialName: anObject [
	comercialName := anObject
]

{ #category : #printing }
Substance >> printOn: aStream [
	^ aStream
		nextPutAll: (self comercialName).
]

{ #category : #accessing }
Substance >> type [
	^ type
]

{ #category : #accessing }
Substance >> type: anObject [
	type := anObject
]
