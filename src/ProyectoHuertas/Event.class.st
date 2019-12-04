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
	^ SubclassResponsibility 
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
	^ SubclassResponsibility 
]

{ #category : #'as yet unclassified' }
Event >> rowText [
	^ SubclassResponsibility 
]

{ #category : #accessing }
Event >> surface [
	^ surface
]

{ #category : #accessing }
Event >> surface: anObject [
	surface := anObject
]
