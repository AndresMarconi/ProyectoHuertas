Class {
	#name : #Plot,
	#superclass : #GafObject,
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

{ #category : #utility }
Plot >> cropAtDateAndTime: aDateAndTime [
	^ (self sowings select: [ :each | each dateAndTime < aDateAndTime ])
		ifEmpty: [ nil ]
		ifNotEmpty: [ :sowings | 
			(sowings asSortedCollection: [ :a :b | a dateAndTime < b dateAndTime ])
				last crop ]
]

{ #category : #'current cycle' }
Plot >> currentCrop [
	^ self currentCycle latestSowing
		ifNil: [ nil ]
		ifNotNil: [ :sowing | sowing crop ]
]

{ #category : #'current cycle' }
Plot >> currentCycle [
	^ currentCycle
]

{ #category : #'current cycle' }
Plot >> dateOfLatestEvent [
	^ currentCycle dateOfLatestEvent
]

{ #category : #'current cycle' }
Plot >> endsOfWithdrawalPeriods [
	^ currentCycle endsOfWithdrawalPeriods
]

{ #category : #accessing }
Plot >> events [
	^ events asSortedCollection: [ :a :b | a date > b date ]
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

{ #category : #utility }
Plot >> frequentelyPlanted [
	^ ((events select: [ :each | each class = Sowing ]) collect: #crop)
		asBag
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

{ #category : #'current cycle' }
Plot >> isInWithdrawal [
	^ currentCycle isInWithdrawal
]

{ #category : #'current cycle' }
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
	^ aStream nextPutAll: 'aPlot (id:' , self id asString , ')'
]

{ #category : #accessing }
Plot >> problems [
	^ self events select: [ :event | event class = AdversityReport ]
]

{ #category : #'current cycle' }
Plot >> recomputeCurrentCycle [
	currentCycle := HarvestingCycle new.
	events do: [ :event | currentCycle addEvent: event ]
]

{ #category : #accessing }
Plot >> removeEvent: anEvent [
	currentCycle removeEvent: anEvent.
	events remove: anEvent.
	anEvent plot: nil.
	currentCycle isOutOfSync
		ifTrue: [ self recomputeCurrentCycle ]
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

{ #category : #'current cycle' }
Plot >> withdrawalPeriodDaysLeft [
	^ currentCycle withdrawalPeriodDaysLeft
]
