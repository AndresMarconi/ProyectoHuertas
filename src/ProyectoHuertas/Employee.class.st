Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
Employee class >> firstName: aName lastName: aSurname [
	^ self new
		firstName: aName;
		lastName: aSurname;
		yourself
]

{ #category : #testing }
Employee class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Employee >> firstName [
	^ firstName
]

{ #category : #accessing }
Employee >> firstName: anObject [
	firstName := anObject
]

{ #category : #accessing }
Employee >> lastName [
	^ lastName
]

{ #category : #accessing }
Employee >> lastName: anObject [
	lastName := anObject
]
