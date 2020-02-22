Class {
	#name : #WhiteListItem,
	#superclass : #FOMObject,
	#instVars : [
		'activeIngredient',
		'aptitud',
		'waste',
		'waitingPeriod'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'as yet unclassified' }
WhiteListItem class >> activeIngredient: anActiveIngredient aptitud: anAptitud waste: aWaste waitingPeriod: aWaitingperiod [
	^ self new 
		activeIngredient: anActiveIngredient;
		aptitud: anAptitud;
		waste: aWaste;
		waitingPeriod: aWaitingperiod;
		yourself
]

{ #category : #testing }
WhiteListItem class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
WhiteListItem >> activeIngredient [
	^ activeIngredient
]

{ #category : #accessing }
WhiteListItem >> activeIngredient: anObject [
	activeIngredient := anObject
]

{ #category : #accessing }
WhiteListItem >> aptitud [
	^ aptitud
]

{ #category : #accessing }
WhiteListItem >> aptitud: anObject [
	aptitud := anObject
]

{ #category : #accessing }
WhiteListItem >> waitingPeriod [
	^ waitingPeriod
]

{ #category : #accessing }
WhiteListItem >> waitingPeriod: anObject [
	waitingPeriod := anObject
]

{ #category : #accessing }
WhiteListItem >> waste [
	^ waste
]

{ #category : #accessing }
WhiteListItem >> waste: anObject [
	waste := anObject
]
