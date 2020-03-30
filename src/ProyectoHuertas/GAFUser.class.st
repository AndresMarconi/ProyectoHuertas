Class {
	#name : #GAFUser,
	#superclass : #GAFObject,
	#instVars : [
		'email',
		'fullname',
		'farms',
		'hashedPassword',
		'isAdmin',
		'isExpert'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
GAFUser class >> email: anEmail fullname: aFullName [
	^ GAFUser new
		email: anEmail;
		fullname: aFullName;
		yourself
]

{ #category : #'instance creation' }
GAFUser class >> email: anEmail fullname: aFullName otherProperties: aDictionaryOfProperties [
	^ GAFUser new
		email: anEmail;
		fullname: aFullName;
		otherProperties: aDictionaryOfProperties;
		yourself
]

{ #category : #'instance creation' }
GAFUser class >> fromOIDCUser: aDictionaryOfProperties [
	^ self
		email: (aDictionaryOfProperties at: 'email')
		fullname: (aDictionaryOfProperties at: 'nickname')
		otherProperties: aDictionaryOfProperties
]

{ #category : #testing }
GAFUser class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
GAFUser >> addFarm: aFarm [
	farms add: aFarm 
]

{ #category : #accessing }
GAFUser >> email [
	^ email
]

{ #category : #accessing }
GAFUser >> email: anObject [
	email := anObject
]

{ #category : #accessing }
GAFUser >> farms [
	^ farms
]

{ #category : #accessing }
GAFUser >> fullname [
	^ fullname
]

{ #category : #accessing }
GAFUser >> fullname: anObject [
	fullname := anObject
]

{ #category : #accessing }
GAFUser >> hashedPassword [
	^ hashedPassword
]

{ #category : #accessing }
GAFUser >> hashedPassword: anObject [
	hashedPassword := anObject
]

{ #category : #initialization }
GAFUser >> initialize [
	super initialize.
	farms := OrderedCollection new.
	isAdmin := false.
	isExpert := false
]

{ #category : #testing }
GAFUser >> isAdmin [
	^ isAdmin
]

{ #category : #accessing }
GAFUser >> isAdmin: anObject [
	isAdmin := anObject
]

{ #category : #testing }
GAFUser >> isExpert [
	^ isExpert
]

{ #category : #accessing }
GAFUser >> isExpert: anObject [
	isExpert := anObject
]

{ #category : #passwords }
GAFUser >> isValidPassword: aHashedPassword [
	^ aHashedPassword = hashedPassword
]
