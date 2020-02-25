Class {
	#name : #FOMObject,
	#superclass : #Object,
	#instVars : [
		'archived',
		'comment'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
FOMObject class >> isVoyageRoot [
	^ true
]

{ #category : #archiving }
FOMObject >> archive [
	archived := true
]

{ #category : #archiving }
FOMObject >> archived [
	^ archived
]

{ #category : #accessing }
FOMObject >> comment [
	^ comment
]

{ #category : #accessing }
FOMObject >> comment: anObject [
	comment := anObject
]

{ #category : #initialization }
FOMObject >> initialize [ 
	archived := false.
	comment := nil.  
]

{ #category : #archiving }
FOMObject >> unarchive [
	archived := false
]
