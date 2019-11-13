Class {
	#name : #Aplication,
	#superclass : #Event,
	#instVars : [
		'type',
		'machine',
		'lack',
		'dose',
		'activeIngredient',
		'input'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Aplication class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Aplication class >> newWithInput: anInput Dose: aDose Type: aType Machine: aMachine Lack: aLack ActiveIngredient: ai Date: aDate Surface: aSurface [
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

{ #category : #accessing }
Aplication >> activeIngredient [
	^ activeIngredient
]

{ #category : #accessing }
Aplication >> activeIngredient: anObject [
	activeIngredient := anObject
]

{ #category : #accessing }
Aplication >> dose [
	^ dose
]

{ #category : #accessing }
Aplication >> dose: anObject [
	dose := anObject
]

{ #category : #accessing }
Aplication >> input [
	^ input
]

{ #category : #accessing }
Aplication >> input: anObject [
	input := anObject
]

{ #category : #accessing }
Aplication >> lack [
	^ lack
]

{ #category : #accessing }
Aplication >> lack: anObject [
	lack := anObject
]

{ #category : #accessing }
Aplication >> machine [
	^ machine
]

{ #category : #accessing }
Aplication >> machine: anObject [
	machine := anObject
]

{ #category : #accessing }
Aplication >> type [
	^ type
]

{ #category : #accessing }
Aplication >> type: anObject [
	type := anObject
]
