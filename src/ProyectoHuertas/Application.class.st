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
Application class >> substance: aSubstance dose: aDose machine: aMachine date: aDate surface: aSurface [
	^ self new
		dose: aDose;
		machine: aMachine;
		date: aDate;
		surface: aSurface;
		substance: aSubstance;
		yourself
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
