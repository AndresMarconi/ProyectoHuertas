Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'firstName',
		'lastName',
		'startDate',
		'salary',
		'notes'
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

{ #category : #accessing }
Employee >> notes [
	^ notes
]

{ #category : #accessing }
Employee >> notes: anObject [
	notes := anObject
]

{ #category : #'as yet unclassified' }
Employee >> rowText [
	^ 'Empleado ', lastName, firstName 
]

{ #category : #accessing }
Employee >> salary [
	^ salary
]

{ #category : #accessing }
Employee >> salary: anObject [
	salary := anObject
]

{ #category : #accessing }
Employee >> startDate [
	^ startDate
]

{ #category : #accessing }
Employee >> startDate: anObject [
	startDate := anObject
]
