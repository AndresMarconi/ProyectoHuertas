Class {
	#name : #Substance,
	#superclass : #FOMObject,
	#instVars : [
		'comercialName',
		'activeIngredients',
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
Substance >> addActiveIngredients: anObject [
	activeIngredients add: anObject
]

{ #category : #modifying }
Substance >> addWithdrawalPeriodRecommendation: withdrawalPeriodRecommendation [
	withdrawalPeriodRecommendations add: withdrawalPeriodRecommendation
]

{ #category : #accessing }
Substance >> allowedUsage [
	^ withdrawalPeriodRecommendations collect: [ :each | each crop ]
]

{ #category : #accessing }
Substance >> applicabilities [
	^ (activeIngredients flatCollect: #applicabilities) asSet
		asSortedCollection
]

{ #category : #accessing }
Substance >> comercialName [
	^ comercialName
]

{ #category : #accessing }
Substance >> comercialName: anObject [
	comercialName := anObject
]

{ #category : #'as yet unclassified' }
Substance >> exportToJson [
	| json |
	json:=  
	'{ "comercialName" : "',  comercialName,  '" , ' ,  ' "activeIngredients" : [  '.
	activeIngredients do: [ :each | json:= json,  (each exportToJson), ' , ' ].
	json at: (json size)-1 put: $].
	json:= json ,  ',  "withdrawalPeriodRecommendations": ['.
	withdrawalPeriodRecommendations do: [ :each | json:= json, (each exportToJson), ' , ' ].
	json at: (json size)-1 put: $].
	json:= json, ' }'.
	^json 
]

{ #category : #initialization }
Substance >> initialize [
	super initialize.
	withdrawalPeriodRecommendations := OrderedCollection new
]

{ #category : #copying }
Substance >> postCopy [
	activeIngredients := activeIngredients copy.
	withdrawalPeriodRecommendations := withdrawalPeriodRecommendations
		collect: #copy.
	comercialName := nil
]

{ #category : #printing }
Substance >> printOn: aStream [
	^ aStream
		nextPutAll: (self comercialName).
]

{ #category : #accessing }
Substance >> recommendationFor: aCrop [
	^ withdrawalPeriodRecommendations
		detect: [ :wp | wp crop = aCrop ]
		ifNone: [ nil ]
]

{ #category : #accessing }
Substance >> registeredCrops [
	^ (activeIngredients flatCollect: #registeredCrops) asSet asArray
]

{ #category : #modifying }
Substance >> removeWithdrawalPeriodRecommendation: withdrawalPeriodRecommendation [
	withdrawalPeriodRecommendations
		remove: withdrawalPeriodRecommendation
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

{ #category : #accessing }
Substance >> withdrawalTimeFor: aCrop [
	^ withdrawalPeriodRecommendations
		detect: [ :wp | wp crop = aCrop ]
		ifFound: [ :it | it daysToWait ]
		ifNone: [ nil ]
]
