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
	^ Farm selectMany: [ :each | each archived ]
]

{ #category : #accessing }
FOMSession >> plots [
	^ farm ifNil: [ Plot selectMany: [ :each | each archived ] ] ifNotNil: [ farm plots ]
]

{ #category : #accessing }
FOMSession >> substances [
	^ Substance selectMany: [ :each | each archived ]
]

{ #category : #accessing }
FOMSession >> users [
  ^ User selectMany: [ :each | each archived ] 
]

{ #category : #accessing }
FOMSession >> varieties [
	^ Variety selectMany: [ :each | each archived ]
]
