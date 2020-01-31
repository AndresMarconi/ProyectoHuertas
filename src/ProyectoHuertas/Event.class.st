Class {
	#name : #Event,
	#superclass : #FOMObject,
	#instVars : [
		'date',
		'surface'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Event class >> isVoyageRoot [
	^ true
]

{ #category : #'as yet unclassified' }
Event >> classRow [
	^ self subclassResponsibility 
]

{ #category : #accessing }
Event >> date [
	^ date
]

{ #category : #accessing }
Event >> date: anObject [
	date := anObject
]

{ #category : #'as yet unclassified' }
Event >> editor [
	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Event >> rowText [
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
