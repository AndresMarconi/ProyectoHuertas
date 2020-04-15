Class {
	#name : #GafObject,
	#superclass : #Object,
	#instVars : [
		'comment'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
GafObject class >> isVoyageRoot [
	^ false
]

{ #category : #accessing }
GafObject >> comment [
	^ comment
]

{ #category : #accessing }
GafObject >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
GafObject >> initialize [ 
	comment := ''.  
]
