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

{ #category : #queries }
HarvestingCycle >> aplications [
	^ events select: [ :each | each class = Application ]
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

{ #category : #accessing }
HarvestingCycle >> events [
	^ events
]

{ #category : #accessing }
HarvestingCycle >> harvestDate [
	^self sowing date addDays: self sowing timeToHarvest
]

{ #category : #accessing }
HarvestingCycle >> harvestDuration [
	^self sowing harvestDuration
]

{ #category : #accessing }
HarvestingCycle >> harvested [
	^ self harvests inject: 0 into: [ :sum :harvest | sum + harvest quantity ]
]

{ #category : #queries }
HarvestingCycle >> harvests [
	^ events select: [ :each | each class = Harvesting ]
]

{ #category : #queries }
HarvestingCycle >> inWaitingPeriod [
	| waitingPeriods |
	waitingPeriods := self aplications collect: [ :app | app endOfWaitingPeriodFor: self sowing crop ].
	(waitingPeriods select: [ :wp | wp isAfter: Date today ])
		ifEmpty: [ ^ nil ]
		ifNotEmpty: [ :it | ^ (it first) subtractDate: Date today ]
]

{ #category : #events }
HarvestingCycle >> initialize [
	events := OrderedCollection new. 
]

{ #category : #events }
HarvestingCycle >> removeEvent: anEvent [
	events remove: anEvent ifAbsent: [ nil ]
]

{ #category : #events }
HarvestingCycle >> restart [
	events ifEmpty: [ ^ self ].
	events last class = Application | (events last class = AdversityReport)
		ifTrue: [ events := OrderedCollection with: events last.
			^ self ].
	events := OrderedCollection new
]

{ #category : #queries }
HarvestingCycle >> sowing [
	self sowings ifEmpty: [ ^ nil ] ifNotEmpty: [ :it | ^ it first ]
]

{ #category : #queries }
HarvestingCycle >> sowings [
	^ events select: [ :each | each class = Sowing ]
]

{ #category : #queries }
HarvestingCycle >> waitingPeriodDaysLeft [
	| endsOfWaitingPeriod |
	self sowings ifEmpty: [ ^ 0 ].
	self aplications ifEmpty: [ ^ 0 ].
	endsOfWaitingPeriod := self aplications
		collect: [ :app | app endOfWaitingPeriodFor: self sowing crop ]
		thenSelect: [ :each | each isAfter: Date today ].
	^ endsOfWaitingPeriod
		ifEmpty: [ 0 ]
		ifNotEmpty: [ :dates | dates max: [ :date | date subtractDate: Date today ] ]
]
