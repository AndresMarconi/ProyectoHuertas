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

{ #category : #archiving }
FOMObject >> archive [
	archived := true
]

{ #category : #archiving }
FOMObject >> archived [
	^ archived
]

{ #category : #initialization }
FOMObject >> initialize [ 
  archived := false.  
]

{ #category : #archiving }
FOMObject >> unarchive [
	archived := false
]
