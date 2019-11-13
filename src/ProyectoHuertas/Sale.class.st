Class {
	#name : #Sale,
	#superclass : #Object,
	#instVars : [
		'date',
		'client',
		'items'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Sale class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Sale class >> newWithClient: aClient Date: aDate [
	| sale |
	sale:= self new.
	^ sale
		date: aDate;
		client: aClient 
]

{ #category : #accessing }
Sale >> addItem: anObject [
	items := anObject
]

{ #category : #accessing }
Sale >> client [
	^ client
]

{ #category : #accessing }
Sale >> client: anObject [
	client := anObject
]

{ #category : #accessing }
Sale >> date [
	^ date
]

{ #category : #accessing }
Sale >> date: anObject [
	date := anObject
]

{ #category : #initialization }
Sale >> initialize [
	items := OrderedCollection new.
]

{ #category : #accessing }
Sale >> items [
	^ items
]
