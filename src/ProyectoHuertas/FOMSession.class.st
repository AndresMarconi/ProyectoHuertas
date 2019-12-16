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
FOMSession >> aplications [
	^ self plots flatCollect: [ :each | each aplications ]
]

{ #category : #accessing }
FOMSession >> farm [
	"the currently selected farm"

	^ farm
]

{ #category : #accessing }
FOMSession >> farms [
	^ user farms
]

{ #category : #accessing }
FOMSession >> harvestings [ 
	^ self plots flatCollect: [ :each | each harvests ]
]

{ #category : #initialization }
FOMSession >> initialize [ 
	super initialize.
	user:= self users at: 1.
	farm := user farms at: 1.
]

{ #category : #accessing }
FOMSession >> plots [
	^ farm ifNil: [ self farms flatCollect: [ :each | each plots ] ] ifNotNil: [ farm plots ]
]

{ #category : #accessing }
FOMSession >> problems [
	^ self plots flatCollect: [ :each | each problems ]
]

{ #category : #accessing }
FOMSession >> sales [
	^ user sales
]

{ #category : #accessing }
FOMSession >> sowings [  
	^ self plots flatCollect: [ :each | each sowings ]
]

{ #category : #accessing }
FOMSession >> stock [
	^ user stock
]

{ #category : #accessing }
FOMSession >> substances [
	^ Substance selectMany: [ :each | each archived ]
]

{ #category : #accessing }
FOMSession >> user [ 
	^ user
]

{ #category : #accessing }
FOMSession >> users [
  ^ (User selectMany: [ :each | each archived ]) asSortedCollection: [ :u1 :u2 | u1 firstName > u2 firstName ]
]

{ #category : #accessing }
FOMSession >> varieties [
	^ Variety selectMany: [ :each | each archived ]
]
