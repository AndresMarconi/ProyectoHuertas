Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'name',
		'surname',
		'password'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Employee class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Employee class >> newWithName: aName Password: aPassword Surname: aSurname [
	| employee |
	employee := self new.
	^ employee 
		name: aName;
		password: aPassword;
		surname: aSurname.
]

{ #category : #accessing }
Employee >> name [
	^ name
]

{ #category : #accessing }
Employee >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Employee >> password [
	^ password
]

{ #category : #accessing }
Employee >> password: anObject [
	password := anObject
]

{ #category : #accessing }
Employee >> surname [
	^ surname
]

{ #category : #accessing }
Employee >> surname: anObject [
	surname := anObject
]
