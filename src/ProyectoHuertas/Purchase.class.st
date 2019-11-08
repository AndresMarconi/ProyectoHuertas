Class {
	#name : #Purchase,
	#superclass : #Object,
	#instVars : [
		'date',
		'distributor',
		'inputs'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Purchase class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Purchase >> date [
	^ date
]

{ #category : #accessing }
Purchase >> date: anObject [
	date := anObject
]

{ #category : #accessing }
Purchase >> distributor [
	^ distributor
]

{ #category : #accessing }
Purchase >> distributor: anObject [
	distributor := anObject
]

{ #category : #accessing }
Purchase >> inputs [
	^ inputs
]

{ #category : #accessing }
Purchase >> inputs: anObject [
	inputs := anObject
]
