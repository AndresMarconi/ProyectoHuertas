Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'name',
		'surname',
		'password',
		'employess',
		'farms',
		'products',
		'sales',
		'purchases',
		'inputs'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
User class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
User class >> newUserName: anUsername Name: aName Surname: aSurname Password: aPassword [
| user |
	user := User new.
	user
		username: anUsername;
		name: aName;
		surname: aSurname;
		password: aPassword.
	^ user
]

{ #category : #accessing }
User >> addFarm: aFarm [
	farms add: aFarm 
]

{ #category : #accessing }
User >> employess [
	^ employess
]

{ #category : #accessing }
User >> employess: anObject [
	employess := anObject
]

{ #category : #accessing }
User >> farms [
	^ farms
]

{ #category : #initialization }
User >> initialize [ 
	employess := OrderedCollection new.
	farms := OrderedCollection new.
	products := OrderedCollection new.
	sales := OrderedCollection new.
	purchases := OrderedCollection new.
	inputs := OrderedCollection new.
]

{ #category : #accessing }
User >> inputs [
	^ inputs
]

{ #category : #accessing }
User >> inputs: anObject [
	inputs := anObject
]

{ #category : #accessing }
User >> name [
	^ name
]

{ #category : #accessing }
User >> name: anObject [
	name := anObject
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
User >> products [
	^ products
]

{ #category : #accessing }
User >> products: anObject [
	products := anObject
]

{ #category : #accessing }
User >> purchases [
	^ purchases
]

{ #category : #accessing }
User >> purchases: anObject [
	purchases := anObject
]

{ #category : #accessing }
User >> sales [
	^ sales
]

{ #category : #accessing }
User >> sales: anObject [
	sales := anObject
]

{ #category : #accessing }
User >> surname [
	^ surname
]

{ #category : #accessing }
User >> surname: anObject [
	surname := anObject
]

{ #category : #accessing }
User >> username [
	^ username
]

{ #category : #accessing }
User >> username: anObject [
	username := anObject
]
