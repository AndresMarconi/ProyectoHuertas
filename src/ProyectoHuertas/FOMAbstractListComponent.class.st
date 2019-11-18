Class {
	#name : #FOMAbstractListComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMAbstractListComponent >> parent [
	^ parent
]

{ #category : #accessing }
FOMAbstractListComponent >> parent: anObject [
	parent := anObject
]
