Class {
	#name : #Plot,
	#superclass : #Object,
	#instVars : [
		'id',
		'surface',
		'events'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
Plot >> initialize [
	events := OrderedCollection new.
]
