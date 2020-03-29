Class {
	#name : #Application,
	#superclass : #Event,
	#instVars : [
		'substance',
		'machine',
		'dose',
		'reason'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
Application class >> date: aDate time: aTime plot: aPlot substance: aSubstance dose: aDose machine: aMachine reason: aReason [
	^ self new
		time: aTime;
		dose: aDose;
		machine: aMachine;
		date: aDate;
		plot: aPlot;
		substance: aSubstance;
		reason: aReason;
		yourself
]

{ #category : #testing }
Application class >> isVoyageRoot [
	^ true
]

{ #category : #constants }
Application class >> reasons [
	^ {'Control de peste' . 'Tratamiento de enfermedad'.
	'Prevención' . 'Preparación de suelo' . 'Otro (aclarar en notas)'}
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
Application >> reason [
	^ reason
]

{ #category : #accessing }
Application >> reason: anObject [
	reason := anObject
]

{ #category : #accessing }
Application >> substance [
	^ substance
]

{ #category : #accessing }
Application >> substance: anObject [
	substance := anObject
]

{ #category : #printing }
Application >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForApplication: self
]

{ #category : #queries }
Application >> waitingPeriodFor: aCrop [
	^ dateAndTime asDate
		addDays: ((substance withdrawalTimeFor: aCrop) ifNil: [ 0 ])
]
