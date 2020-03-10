Class {
	#name : #Plot,
	#superclass : #FOMObject,
	#instVars : [
		'id',
		'surface',
		'events',
		'currentCycle'
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
Plot >> addEvent: anEvent [
	currentCycle addEvent: anEvent.
	events add: anEvent.
	anEvent plot: self
]

{ #category : #accessing }
Plot >> aplications [
	^ self events select: [ :event | event class = Application ]
]

{ #category : #archiving }
Plot >> archive [
	super archive.
	events do: #archive
]

{ #category : #accessing }
Plot >> events [
	^ (events reject: [ :each | each archived])
		asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #utility }
Plot >> frequentelyApplied [
	^ ((events select: [ :each | each class = Application ])
		collect: #substance) asBag
]

{ #category : #utility }
Plot >> frequentelyHarvested [
	^ ((events select: [ :each | each class = Harvesting ])
		collect: #crop) asBag
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
	super initialize.
	currentCycle := HarvestingCycle new.
	events := OrderedCollection new
]

{ #category : #accessing }
Plot >> lastSowing [
	self sowings ifEmpty: [ ^ 'sin siembras' ] 
		ifNotEmpty:[ ^ self sowings first crop ]
]

{ #category : #accessing }
Plot >> lastestSowing [
	^ self sowings
		ifEmpty: [ nil ]
		ifNotEmpty: [ :sowings | 
			(sowings
				asSortedCollection: [ :earlier :later | earlier date < later date ] )last ]
]

{ #category : #copying }
Plot >> postCopy [
	events := OrderedCollection new.
	id := id, ' (copia)'
]

{ #category : #printing }
Plot >> printOn: aStream [
	^ aStream
		nextPutAll: ('Lote ');
		nextPutAll: (self id asString)
]

{ #category : #accessing }
Plot >> problems [
	^ self events select: [ :event | event class = Problem ]
]

{ #category : #accessing }
Plot >> sowings [
	^ self events select: [ :event | event class = Sowing ]
]

{ #category : #accessing }
Plot >> surface [
	^ surface
]

{ #category : #accessing }
Plot >> surface: anObject [
	surface := anObject
]
