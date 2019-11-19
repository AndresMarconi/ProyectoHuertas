Class {
	#name : #FOMSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'farm'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMSession >> farm [
	"the currently selected farm"

	^ farm
]

{ #category : #accessing }
FOMSession >> farms [
	^ Farm selectAll
]

{ #category : #accessing }
FOMSession >> plots [
	^ farm ifNil: [ Plot selectAll ] ifNotNil: [ farm plots ]
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
