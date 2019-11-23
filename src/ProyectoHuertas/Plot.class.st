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

{ #category : #'instance creation' }
Plot class >> id: anId surface: aSurface [
	^ self new
		id: anId;
		surface: aSurface;
		yourself
]

{ #category : #testing }
Plot class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Plot >> addEvent: anObject [
	events add: anObject
]

{ #category : #accessing }
Plot >> aplications [
	^ events select: [ :event | event class = Application ]
]

{ #category : #accessing }
Plot >> events [
	^ events asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #accessing }
Plot >> harvests [
	^ (self events) select: [ :event | event class = Harvesting ]
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

{ #category : #printing }
Plot >> printOn: aStream [
	^ aStream
		nextPutAll: ('Lote N° ');
		nextPutAll: (self id)
]

{ #category : #accessing }
Plot >> problems [
	^ events select: [ :event | event class = Problem ]
]

{ #category : #accessing }
Plot >> sowings [
	^ events select: [ :event | event class = Sowing ]
]

{ #category : #accessing }
Plot >> surface [
	^ surface
]

{ #category : #accessing }
Plot >> surface: anObject [
	surface := anObject
]
