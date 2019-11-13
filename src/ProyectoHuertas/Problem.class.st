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

{ #category : #'instance creation' }
Problem class >> newWithName: aName Date: aDate Surface: aSurface [
	| problem |
	problem := self new.
	^ problem
		name: aName;
		date: aDate;
		surface: aSurface
]

{ #category : #accessing }
Problem >> addSolutions: anObject [
	solutions add: anObject
]

{ #category : #initialization }
Problem >> initialize [
	solutions := OrderedCollection new.
]

{ #category : #testing }
Problem >> isEvent: aName [
	^ aName = 'problem'
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
