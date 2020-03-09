Class {
	#name : #Event,
	#superclass : #FOMObject,
	#instVars : [
		'plot',
		'surface',
		'dateAndTime'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Event class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Event >> date [
	^ dateAndTime asDate
]

{ #category : #accessing }
Event >> date: aDate [
	dateAndTime := DateAndTime date: aDate time: dateAndTime asTime
]

{ #category : #accessing }
Event >> dateAndTime [
	^ dateAndTime
]

{ #category : #accessing }
Event >> initialize [
	super initialize.
	dateAndTime := DateAndTime now
]

{ #category : #accessing }
Event >> plot [
	^ plot
]

{ #category : #accessing }
Event >> plot: anObject [
	plot := anObject
]

{ #category : #copying }
Event >> postCopy [
	plot := nil.
	^ self
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

{ #category : #accessing }
Event >> time [
	^ dateAndTime asTime 
]

{ #category : #accessing }
Event >> time: aTime [
	dateAndTime := DateAndTime date: dateAndTime asDate time: aTime
]
