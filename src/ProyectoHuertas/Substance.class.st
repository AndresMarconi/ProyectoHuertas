Class {
	#name : #Substance,
	#superclass : #Object,
	#instVars : [
		'comercialName',
		'brand',
		'activeIngredients',
		'waitingPeriodAfterApplication'
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
Substance >> brand [
	^ brand
]

{ #category : #accessing }
Substance >> brand: anObject [
	brand := anObject
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
		nextPutAll: (self comercialName);
		nextPutAll: (' - ');
		nextPutAll: (self brand).
]

{ #category : #'as yet unclassified' }
Substance >> rowText [
	^ comercialName, ' de ', brand
]

{ #category : #accessing }
Substance >> waitingPeriodAfterApplication [
	^ waitingPeriodAfterApplication
]

{ #category : #accessing }
Substance >> waitingPeriodAfterApplication: anObject [
	waitingPeriodAfterApplication := anObject
]
