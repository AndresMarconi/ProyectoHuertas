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

{ #category : #'as yet unclassified' }
Substance >> withdrawalPeriodOf: aCrop [
	(withdrawalPeriodRecommendations select: [ :wp | wp crop = aCrop ]) 
	ifEmpty: [ ^0 ] ifNotEmpty: [ :it | ^(it at: 1) daysToWait ]
]

{ #category : #accessing }
Substance >> withdrawalPeriodRecommendations [
	^ withdrawalPeriodRecommendations
]

{ #category : #accessing }
Substance >> withdrawalPeriodRecommendationsByDays [
	| simplifiedWithdrawalPeriodRecommendations |
	simplifiedWithdrawalPeriodRecommendations := Dictionary new.
	withdrawalPeriodRecommendations
		do: [ :recommendation | 
			(simplifiedWithdrawalPeriodRecommendations
				at: recommendation daysToWait 
				ifAbsentPut: OrderedCollection new) add: recommendation ].
	^ simplifiedWithdrawalPeriodRecommendations
]
