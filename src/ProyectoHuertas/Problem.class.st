Class {
	#name : #Problem,
	#superclass : #Event,
	#instVars : [
		'name',
		'solutions'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Problem class >> isVoyageRoot [
	^ true
]

{ #category : #initialization }
Problem >> initialize [
	solutions := OrderedCollection new.
]

{ #category : #accessing }
Problem >> name [
	^ name
]

{ #category : #accessing }
Problem >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Problem >> solutions [
	^ solutions
]

{ #category : #accessing }
Problem >> solutions: anObject [
	solutions := anObject
]
