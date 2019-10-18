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

{ #category : #initialization }
Sale >> initialize [
	items := OrderedCollection new.
]
