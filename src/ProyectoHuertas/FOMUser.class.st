Class {
	#name : #FOMUser,
	#superclass : #FOMObject,
	#instVars : [
		'email',
		'fullname',
		'farms',
		'stock',
		'sales',
		'otherProperties'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'instance creation' }
FOMUser class >> email: anEmail fullname: aFullName [
	^ FOMUser new
		email: anEmail;
		fullname: aFullName;
		yourself
]

{ #category : #'instance creation' }
FOMUser class >> email: anEmail fullname: aFullName otherProperties: aDictionaryOfProperties [
	^ FOMUser new
		email: anEmail;
		fullname: aFullName;
		otherProperties: aDictionaryOfProperties;
		yourself
]

{ #category : #'instance creation' }
FOMUser class >> fromOIDCUser: aDictionaryOfProperties [
	^ self
		email: (aDictionaryOfProperties at: 'email')
		fullname: (aDictionaryOfProperties at: 'nickname')
		otherProperties: aDictionaryOfProperties
]

{ #category : #testing }
FOMUser class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
FOMUser >> addFarm: aFarm [
	farms add: aFarm 
]

{ #category : #accessing }
FOMUser >> addSale: aSale [
	sales add: aSale 
]

{ #category : #accessing }
FOMUser >> addStock: aSubstance [
	stock add: aSubstance  
]

{ #category : #accessing }
FOMUser >> email [
	^ email
]

{ #category : #accessing }
FOMUser >> email: anObject [
	email := anObject
]

{ #category : #accessing }
FOMUser >> farms [
	^ farms reject: [ :farm | farm archived ]
]

{ #category : #accessing }
FOMUser >> fullname [
	^ fullname
]

{ #category : #accessing }
FOMUser >> fullname: anObject [
	fullname := anObject
]

{ #category : #initialization }
FOMUser >> initialize [ 
	farms := OrderedCollection new.
	stock := OrderedCollection new.
	sales := OrderedCollection new.
]

{ #category : #accessing }
FOMUser >> otherProperties [
	^ otherProperties
]

{ #category : #accessing }
FOMUser >> otherProperties: anObject [
	otherProperties := anObject
]

{ #category : #accessing }
FOMUser >> sales [
	^ sales reject: [ :sale | sale archived ]
]

{ #category : #accessing }
FOMUser >> stock [
	^ stock reject: [ :substance | substance archived ]
]
