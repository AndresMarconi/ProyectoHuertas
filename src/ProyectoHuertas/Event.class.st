Class {
	#name : #Event,
	#superclass : #FOMObject,
	#instVars : [
		'plot',
		'date',
		'surface'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Event class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Event >> date [
	^ date
]

{ #category : #accessing }
Event >> date: anObject [
	date := anObject
]

{ #category : #accessing }
Event >> plot [
	^ plot
]

{ #category : #accessing }
Event >> plot: anObject [
	plot := anObject
]

{ #category : #printing }
Event >> summaryFor: aSummaryRequestor [
	^ self subclassResponsibility
]

{ #category : #accessing }
Event >> surface [
	^ surface
]

{ #category : #accessing }
Event >> surface: anObject [
	surface := anObject
]
