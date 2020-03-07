Class {
	#name : #Problem,
	#superclass : #Event,
	#instVars : [
		'name',
		'type'
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
	^ 'Adversidad'
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
