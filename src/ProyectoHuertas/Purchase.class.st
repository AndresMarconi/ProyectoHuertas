Class {
	#name : #Purchase,
	#superclass : #Object,
	#instVars : [
		'date',
		'distributor',
		'inputs'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
Purchase class >> input: anInput distribution: aDist date: aDate [
	^ self new
		date: aDate;
		inputs: anInput;
		distribution: aDist;
		yourself
]

{ #category : #testing }
Purchase class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Purchase >> date [
	^ date
]

{ #category : #accessing }
Purchase >> date: anObject [
	date := anObject
]

{ #category : #accessing }
Purchase >> distributor [
	^ distributor
]

{ #category : #accessing }
Purchase >> distributor: anObject [
	distributor := anObject
]

{ #category : #accessing }
Purchase >> inputs [
	^ inputs
]

{ #category : #accessing }
Purchase >> inputs: anObject [
	inputs := anObject
]

{ #category : #'as yet unclassified' }
Purchase >> rowText [
	^ 'Compra de ', inputs, ' realizada el ', Date, ' a', distributor 
]
