Class {
	#name : #FOMSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'sistema'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
FOMSession >> initialize [
	super initialize.
	sistema := SystemDevelop new.
]

{ #category : #accessing }
FOMSession >> sistema [
	^ sistema
]
