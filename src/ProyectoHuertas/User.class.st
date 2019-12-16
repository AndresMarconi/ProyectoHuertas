Class {
	#name : #User,
	#superclass : #FOMObject,
	#instVars : [
		'username',
		'firstName',
		'lastName',
		'password',
		'farms',
		'stock',
		'sales'
	],
	#category : #'ProyectoHuertas-ui-core'
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
		archived: true;
		yourself
]

{ #category : #accessing }
User >> addFarm: aFarm [
	farms add: aFarm 
]

{ #category : #accessing }
User >> addSale: aSale [
	sales add: aSale 
]

{ #category : #accessing }
User >> addStock: aSubstance [
	stock add: aSubstance  
]

{ #category : #accessing }
User >> farms [
	^ farms select: [ :farm | farm archived ]
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
	stock := OrderedCollection new.
	sales := OrderedCollection new.
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
User >> sales [
	^ sales select: [ :sale | sale archived ]
]

{ #category : #accessing }
User >> stock [
	^ stock select: [ :substance | substance archived ]
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #accessing }
User >> username: anObject [
	username := anObject
]
