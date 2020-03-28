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

{ #category : #'as yet unclassified' }
HarvestingCycle >> endOfPeriod [
	^ self harvestDate addDays: self sowing harvestDuration.
]

{ #category : #'as yet unclassified' }
HarvestingCycle >> harvestDate [
	^ self sowing date addDays: self sowing timeToHarvest.
]

{ #category : #'as yet unclassified' }
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
	waitingPeriods := self aplications
		collect: [ :app | app waitingPeriodFor: self sowing crop ].
	(waitingPeriods select: [ :wp | wp isAfter: Date today ])
		ifEmpty: [ ^ nil ]
		ifNotEmpty: [ :it | ^ it first ]
]

{ #category : #events }
HarvestingCycle >> initialize [
	events := OrderedCollection new. 
]

{ #category : #events }
HarvestingCycle >> restart [
	events ifEmpty: [ ^ self ].
	events last class = Application | (events last class = Problem)
		ifTrue: [ events := OrderedCollection with: events last.
			^ self ].
	events := OrderedCollection new
]

{ #category : #queries }
HarvestingCycle >> sowing [
	self sowings ifEmpty: 
	[ ^Sowing date: ('1900-09-09' asDate) 
				 time: ('18:00' asTime)  
				 plot: (Plot new) 
				 crop: (Crop new) 
				 quantity: '2000' 
				 timeToHarvest: 0 
				 harvestDuration: 0 
				 expectedYield: 0 ] 		
	ifNotEmpty: [ :it | ^it first ]
]

{ #category : #queries }
HarvestingCycle >> sowings [
	^ events select: [ :each | each class = Sowing ]
]
