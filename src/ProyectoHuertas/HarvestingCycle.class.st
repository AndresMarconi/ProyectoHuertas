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
HarvestingCycle >> inWaitingPeriod [
	| waitingPeriods |
	waitingPeriods:= self aplications collect: [ :app | app waitingPeriodFor: (self sowing crop) ].
	(waitingPeriods select: [ :wp | wp isAfter: Date today ] )
	ifEmpty: [ ^nil ] ifNotEmpty: [ :it | ^it first ]
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
	^ self sowings first.
]

{ #category : #queries }
HarvestingCycle >> sowings [
	^ events select: [ :each | each class = Sowing ]
]
