Class {
	#name : #Substance,
	#superclass : #FOMObject,
	#instVars : [
		'comercialName',
		'activeIngredients',
		'usage',
		'withdrawalPeriodRecommendations'
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
Substance >> addWithdrawalPeriodRecommendation: withdrawalPeriodRecommendation [
	withdrawalPeriodRecommendations add: withdrawalPeriodRecommendation
]

{ #category : #accessing }
Substance >> comercialName [
	^ comercialName
]

{ #category : #accessing }
Substance >> comercialName: anObject [
	comercialName := anObject
]

{ #category : #initialization }
Substance >> initialize [
	super initialize.
	withdrawalPeriodRecommendations := OrderedCollection new
]

{ #category : #printing }
Substance >> printOn: aStream [
	^ aStream
		nextPutAll: (self comercialName).
]

{ #category : #accessing }
Substance >> removeWithdrawalPeriodRecommendation: withdrawalPeriodRecommendation [
	withdrawalPeriodRecommendations
		remove: withdrawalPeriodRecommendation
]

{ #category : #accessing }
Substance >> usage [
	^ usage
]

{ #category : #accessing }
Substance >> usage: anObject [
	usage := anObject
]

{ #category : #accessing }
Substance >> withdrawalPeriodRecommendations [
	^ withdrawalPeriodRecommendations
]
