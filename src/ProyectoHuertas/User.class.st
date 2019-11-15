Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'firstName',
		'lastName',
		'password',
		'farms'
	],
	#category : #'ProyectoHuertas-ui'
}

{ #category : #testing }
User class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
User class >> username: anUsername firstName: aFirstName lastName: aLastname password: aPassword [
	^ User new
		username: anUsername;
		firstName: aFirstName;
		lastName: aLastname;
		password: aPassword;
		yourself
]

{ #category : #accessing }
User >> addFarm: aFarm [
	farms add: aFarm 
]

{ #category : #accessing }
User >> farms [
	^ farms
]

{ #category : #accessing }
User >> firstName [
	^ firstName
]

{ #category : #accessing }
User >> firstName: anObject [
	firstName := anObject
]

{ #category : #initialization }
User >> initialize [ 
	farms := OrderedCollection new.

]

{ #category : #accessing }
User >> lastName [
	^ lastName
]

{ #category : #accessing }
User >> lastName: anObject [
	lastName := anObject
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #accessing }
User >> username: anObject [
	username := anObject
]
