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
HarvestingCycle >> sowings [
	^ events select: [ :each | each class = Sowing ]
]
