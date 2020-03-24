Class {
	#name : #GAFObject,
	#superclass : #Object,
	#instVars : [
		'comment'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
GAFObject class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
GAFObject >> comment [
	^ comment
]

{ #category : #accessing }
GAFObject >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
GAFObject >> initialize [ 
	comment := ''.  
]
