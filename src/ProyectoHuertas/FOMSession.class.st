Class {
	#name : #FOMSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'sistema'
	],
	#category : #'ProyectoHuertas-ui'
}

{ #category : #initialization }
FOMSession >> initialize [
	super initialize.
	sistema := FOMVoyageExampleLoader new.
]

{ #category : #accessing }
FOMSession >> sistema [
	^ sistema
]
