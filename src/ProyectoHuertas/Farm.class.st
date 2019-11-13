Class {
	#name : #Farm,
	#superclass : #Object,
	#instVars : [
		'name',
		'plots',
		'campaings'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Farm class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Farm class >> newWithName: aName [
| farm |
	farm := self new.
	^ farm name: aName.
]

{ #category : #accessing }
Farm >> addCampaings: anObject [
	campaings add: anObject
]

{ #category : #accessing }
Farm >> addPlot: anObject [
	plots add: anObject
]

{ #category : #accessing }
Farm >> campaings [
	^ campaings
]

{ #category : #initialization }
Farm >> initialize [
	campaings := OrderedCollection new.
	plots := OrderedCollection new.
]

{ #category : #accessing }
Farm >> name [
	^ name
]

{ #category : #accessing }
Farm >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Farm >> plots [
	^ plots
]
