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
Farm class >> newFarm: aName [
| farm |
	farm := self new.
	farm name: aName.
	^ farm
]

{ #category : #accessing }
Farm >> campaings [
	^ campaings
]

{ #category : #accessing }
Farm >> campaings: anObject [
	campaings := anObject
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

{ #category : #accessing }
Farm >> plots: anObject [
	plots := anObject
]
