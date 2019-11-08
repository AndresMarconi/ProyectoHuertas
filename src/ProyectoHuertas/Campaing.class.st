Class {
	#name : #Campaing,
	#superclass : #Object,
	#instVars : [
		'year',
		'startDate',
		'endDate'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Campaing class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Campaing >> endDate [
	^ endDate
]

{ #category : #accessing }
Campaing >> endDate: anObject [
	endDate := anObject
]

{ #category : #accessing }
Campaing >> startDate [
	^ startDate
]

{ #category : #accessing }
Campaing >> startDate: anObject [
	startDate := anObject
]

{ #category : #accessing }
Campaing >> year [
	^ year
]

{ #category : #accessing }
Campaing >> year: anObject [
	year := anObject
]
