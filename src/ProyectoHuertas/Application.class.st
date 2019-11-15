Class {
	#name : #Application,
	#superclass : #Event,
	#instVars : [
		'substance',
		'machine',
		'dose'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Application class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Application class >> newWithInput: anInput Dose: aDose Type: aType Machine: aMachine Lack: aLack ActiveIngredient: ai Date: aDate Surface: aSurface [
	| aplication |
	aplication := self new.
	^ aplication
		input: anInput;
		dose: aDose;
		type: aType;
		machine: aMachine;
		lack: aLack;
		activeIngredient: ai;
		date: aDate;
		surface: aSurface
]

{ #category : #'instance creation' }
Application class >> substance: aSubstance dose: aDose machine: aMachine date: aDate surface: aSurface [
	^ self new
		dose: aDose;
		machine: aMachine;
		date: aDate;
		surface: aSurface;
		yourself
]

{ #category : #accessing }
Application >> activeIngredient [
	^ activeIngredient
]

{ #category : #accessing }
Application >> activeIngredient: anObject [
	activeIngredient := anObject
]

{ #category : #accessing }
Application >> dose [
	^ dose
]

{ #category : #accessing }
Application >> dose: anObject [
	dose := anObject
]

{ #category : #accessing }
Application >> input [
	^ input
]

{ #category : #accessing }
Application >> input: anObject [
	input := anObject
]

{ #category : #testing }
Application >> isEvent: aName [
	^ aName = 'aplication'
]

{ #category : #accessing }
Application >> lack [
	^ lack
]

{ #category : #accessing }
Application >> lack: anObject [
	lack := anObject
]

{ #category : #accessing }
Application >> machine [
	^ machine
]

{ #category : #accessing }
Application >> machine: anObject [
	machine := anObject
]

{ #category : #accessing }
Application >> substance [
	^ substance
]

{ #category : #accessing }
Application >> substance: anObject [
	substance := anObject
]

{ #category : #accessing }
Application >> type [
	^ type
]

{ #category : #accessing }
Application >> type: anObject [
	type := anObject
]
