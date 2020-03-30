Class {
	#name : #Problem,
	#superclass : #Event,
	#instVars : [
		'name',
		'type'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'as yet unclassified' }
Problem class >> date: aDate time: aTime plot: aPlot name: aName type: aType [ 
	^ self new
		date: aDate;
		time: aTime;
		plot: aPlot;
		name: aName;
		type: aType;
		yourself
]

{ #category : #testing }
Problem class >> isVoyageRoot [
	^ true
]

{ #category : #constants }
Problem class >> types [
	"types of possible problems"

	^ #('Ácaros' 'Enfermedad' 'Hongos' 'Insectos' 'Malezas' 'Carencia nutricional' 'Nemátodos' 'Otro')
]

{ #category : #accessing }
Problem >> name [
	^ name
]

{ #category : #accessing }
Problem >> name: anObject [
	name := anObject
]

{ #category : #printing }
Problem >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForProblem: self
]

{ #category : #accessing }
Problem >> type [
	^ type
]

{ #category : #accessing }
Problem >> type: anObject [
	type := anObject
]
