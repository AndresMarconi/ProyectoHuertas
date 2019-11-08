Class {
	#name : #Plot,
	#superclass : #Object,
	#instVars : [
		'id',
		'surface',
		'events'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Plot class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Plot >> events [
	^ events
]

{ #category : #accessing }
Plot >> events: anObject [
	events := anObject
]

{ #category : #accessing }
Plot >> id [
	^ id
]

{ #category : #accessing }
Plot >> id: anObject [
	id := anObject
]

{ #category : #initialization }
Plot >> initialize [
	events := OrderedCollection new.
]

{ #category : #accessing }
Plot >> surface [
	^ surface
]

{ #category : #accessing }
Plot >> surface: anObject [
	surface := anObject
]
