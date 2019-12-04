Class {
	#name : #FOMObject,
	#superclass : #Object,
	#instVars : [
		'archived'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
FOMObject class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
FOMObject >> archived [
	^ archived
]

{ #category : #accessing }
FOMObject >> archived: anObject [
	archived := anObject
]
