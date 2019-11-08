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
