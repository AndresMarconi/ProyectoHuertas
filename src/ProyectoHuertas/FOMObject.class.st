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

{ #category : #'instance creation' }
FOMObject class >> newFom [
	^ self new
		archived: true
]

{ #category : #accessing }
FOMObject >> archived [
	^ archived
]

{ #category : #accessing }
FOMObject >> archived: anObject [
	archived := anObject
]

{ #category : #'submorphs-add/remove' }
FOMObject >> delete [ 
	archived:= false.
]
