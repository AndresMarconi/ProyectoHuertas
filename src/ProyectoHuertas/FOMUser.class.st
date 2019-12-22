Class {
	#name : #FOMUser,
	#superclass : #FOMObject,
	#instVars : [
		'email',
		'fullname',
		'farms',
		'stock',
		'sales'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'instance creation' }
FOMUser class >> email: anEmail fullname: aFullName [
	^ FOMUser new
		email: anEmail;
		fullname: aFullName;
		archived: false;
		yourself
]

{ #category : #'instance-creation' }
FOMUser class >> fromOIDCUser: aDictionaryOfProperties [
	^ self
		email: (aDictionaryOfProperties at: 'email')
		fullname: (aDictionaryOfProperties at: 'name')
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
	^ farms select: [ :farm | farm archived ]
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
FOMUser >> sales [
	^ sales select: [ :sale | sale archived ]
]

{ #category : #accessing }
FOMUser >> stock [
	^ stock select: [ :substance | substance archived ]
]
