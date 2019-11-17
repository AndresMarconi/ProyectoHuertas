Class {
	#name : #FOMSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMSession >> farms [
	^ Farm selectAll
]

{ #category : #accessing }
FOMSession >> substances [
	^ Substance selectAll
]

{ #category : #accessing }
FOMSession >> users [
  ^User selectAll 
]

{ #category : #accessing }
FOMSession >> varieties [
	^ Variety selectAll
]
