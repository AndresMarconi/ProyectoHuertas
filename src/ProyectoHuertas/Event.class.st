Class {
	#name : #Event,
	#superclass : #Object,
	#instVars : [
		'date',
		'surface'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Event class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Event >> date [
	^ date
]

{ #category : #accessing }
Event >> date: anObject [
	date := anObject
]

{ #category : #testing }
Event >> isEvent: aName [
	^ SubclassResponsibility 
]

{ #category : #accessing }
Event >> surface [
	^ surface
]

{ #category : #accessing }
Event >> surface: anObject [
	surface := anObject
]
