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
User class >> newWithName: anUsername Name: aName Surname: aSurname Password: aPassword [
| user |
	user := User new.
	^ user
		username: anUsername;
		name: aName;
		surname: aSurname;
		password: aPassword.
]

{ #category : #accessing }
User >> addEmploy: anObject [
	employess add: anObject
]

{ #category : #accessing }
User >> addFarm: aFarm [
	farms add: aFarm 
]

{ #category : #accessing }
User >> addInput: anObject [
	inputs add: anObject
]

{ #category : #accessing }
User >> addProduct: anObject [
	products add: anObject
]

{ #category : #accessing }
User >> addPurchase: anObject [
	purchases add: anObject
]

{ #category : #accessing }
User >> addSale: anObject [
	sales add: anObject
]

{ #category : #accessing }
User >> employess [
	^ employess
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
User >> purchases [
	^ purchases
]

{ #category : #accessing }
User >> sales [
	^ sales
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
