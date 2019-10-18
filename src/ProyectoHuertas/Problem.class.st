Class {
	#name : #Problem,
	#superclass : #Event,
	#instVars : [
		'name',
		'solutions'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
Problem >> initialize [
	solutions := OrderedCollection new.
]
