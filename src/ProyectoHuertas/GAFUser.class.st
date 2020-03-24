Class {
	#name : #GAFUser,
	#superclass : #GAFObject,
	#instVars : [
		'email',
		'fullname',
		'farms',
		'otherProperties'
	],
	#category : #'ProyectoHuertas-ui-common'
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

{ #category : #initialization }
GAFUser >> initialize [
	super initialize.
	farms := OrderedCollection new
]

{ #category : #accessing }
GAFUser >> otherProperties [
	^ otherProperties
]

{ #category : #accessing }
GAFUser >> otherProperties: anObject [
	otherProperties := anObject
]
