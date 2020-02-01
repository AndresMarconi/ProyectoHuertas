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
Problem class >> name: aName date: aDate surface: aSurface [
	^ self new
		name: aName;
		date: aDate;
		surface: aSurface;
		yourself
]

{ #category : #accessing }
Problem class >> typeDescriptor [
	^ 'Problema'
]

{ #category : #accessing }
Problem >> addSolutions: anObject [
	solutions add: anObject
]

{ #category : #'as yet unclassified' }
Problem >> editor [ 
	^ ProblemEditor subject: self
]

{ #category : #initialization }
Problem >> initialize [
   super initialize.
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

{ #category : #printing }
Problem >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForProblem: self
]
