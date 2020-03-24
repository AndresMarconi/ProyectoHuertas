Class {
	#name : #GAFObject,
	#superclass : #Object,
	#instVars : [
		'archived',
		'comment'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
GAFObject class >> isVoyageRoot [
	^ true
]

{ #category : #archiving }
GAFObject >> archive [
	archived := true
]

{ #category : #archiving }
GAFObject >> archived [
	^ archived
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
	archived := false.
	comment := ''.  
]

{ #category : #archiving }
GAFObject >> unarchive [
	archived := false
]
