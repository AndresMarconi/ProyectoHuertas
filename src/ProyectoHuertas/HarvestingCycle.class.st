Class {
	#name : #HarvestingCycle,
	#superclass : #Object,
	#instVars : [
		'events'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #events }
HarvestingCycle >> addEvent: anEvent [
	anEvent species = Sowing ifTrue: [ self restart. ].
	events add: anEvent 
]

{ #category : #events }
HarvestingCycle >> aplications [
	^ events select: [ :each | each class = Application ]
]

{ #category : #queries }
HarvestingCycle >> dateOfLatestEvent [
	events ifEmpty: [ ^ nil ].
	^ (events collect: #date) max
]

{ #category : #queries }
HarvestingCycle >> daysToEndOfHarvest [
	^self endOfPeriod subtractDate: Date today
]

{ #category : #queries }
HarvestingCycle >> daysToHarvest [
	^self harvestDate subtractDate: Date today
]

{ #category : #accessing }
HarvestingCycle >> endOfPeriod [
	^ self harvestDate addDays: self harvestDuration.
]

{ #category : #queries }
HarvestingCycle >> endsOfWaitingPeriods [
	self aplications ifEmpty: [ ^ Array new ].
	^ self aplications
		collect: [ :app | app endOfWaitingPeriodFor: self latestSowing crop ]
		thenSelect: [ :each | each isAfter: Date today ]
]

{ #category : #accessing }
HarvestingCycle >> events [
	^ events
]

{ #category : #accessing }
HarvestingCycle >> harvestDate [
	^self latestSowing date addDays: self latestSowing timeToHarvest
]

{ #category : #accessing }
HarvestingCycle >> harvestDuration [
	^self latestSowing harvestDuration
]

{ #category : #accessing }
HarvestingCycle >> harvested [
	^ self harvests inject: 0 into: [ :sum :harvest | sum + harvest quantity ]
]

{ #category : #events }
HarvestingCycle >> harvests [
	^ events select: [ :each | each class = Harvesting ]
]

{ #category : #queries }
HarvestingCycle >> inWaitingPeriod [
	| waitingPeriods |
	waitingPeriods := self aplications collect: [ :app | app endOfWaitingPeriodFor: self latestSowing crop ].
	(waitingPeriods select: [ :wp | wp isAfter: Date today ])
		ifEmpty: [ ^ nil ]
		ifNotEmpty: [ :it | ^ (it first) subtractDate: Date today ]
]

{ #category : #initialization }
HarvestingCycle >> initialize [
	events := OrderedCollection new. 
]

{ #category : #testing }
HarvestingCycle >> isStaggered [
	^ self sowings size > 1
]

{ #category : #events }
HarvestingCycle >> latestSowing [
	self sowings ifEmpty: [ ^ nil ] ifNotEmpty: [ :it | ^ it first ]
]

{ #category : #events }
HarvestingCycle >> removeEvent: anEvent [
	events remove: anEvent ifAbsent: [ nil ]
]

{ #category : #private }
HarvestingCycle >> restart [
	events ifEmpty: [ ^ self ].
	events last class = Application | (events last class = AdversityReport)
		ifTrue: [ events := OrderedCollection with: events last.
			^ self ].
	events := OrderedCollection new
]

{ #category : #events }
HarvestingCycle >> sowings [
	^ events select: [ :each | each class = Sowing ]
]

{ #category : #queries }
HarvestingCycle >> timeOfLatestEvent [
	events ifEmpty: [ ^ nil ].
	^ (events collect: #time) max
]

{ #category : #queries }
HarvestingCycle >> waitingPeriodDaysLeft [
	self sowings ifEmpty: [ ^ 0 ].
	^ self endsOfWaitingPeriods
		ifEmpty: [ 0 ]
		ifNotEmpty: [ :dates | dates max: [ :date | date subtractDate: Date today ] ]
]
