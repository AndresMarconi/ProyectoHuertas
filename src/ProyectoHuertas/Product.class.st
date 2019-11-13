Class {
	#name : #Product,
	#superclass : #Object,
	#instVars : [
		'name',
		'variety'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Product class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Product class >> newWithName: aName Variety: aVariety [
	| product |
	product := self new.
	^ product
		name: aName;
		variety: aVariety
]

{ #category : #accessing }
Product >> name [
	^ name
]

{ #category : #accessing }
Product >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Product >> variety [
	^ variety
]

{ #category : #accessing }
Product >> variety: anObject [
	variety := anObject
]
