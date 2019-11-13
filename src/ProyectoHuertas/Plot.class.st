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

{ #category : #'instance creation' }
Plot class >> newWithId: anId Surface: aSurface [
| plot |
	plot := Plot new.
	^ plot
		id: anId;
		surface: aSurface.
]

{ #category : #accessing }
Plot >> addEvent: anObject [
	events add: anObject
]

{ #category : #accessing }
Plot >> aplications [
	^ events select: [ :event | event isEvent: 'aplication' ]
]

{ #category : #accessing }
Plot >> events [
	^ events
]

{ #category : #accessing }
Plot >> harvests [
	^ events select: [ :event | event isEvent: 'harvest' ]
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
Plot >> problems [
	^ events select: [ :event | event isEvent: 'problem' ]
]

{ #category : #accessing }
Plot >> sowings [
	^ events select: [ :event | event isEvent: 'sowing' ]
]

{ #category : #accessing }
Plot >> surface [
	^ surface
]

{ #category : #accessing }
Plot >> surface: anObject [
	surface := anObject
]
