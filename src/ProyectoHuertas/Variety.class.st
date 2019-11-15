Class {
	#name : #Variety,
	#superclass : #Object,
	#instVars : [
		'vulgarName',
		'taxonomicName'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Variety class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Variety class >> name: aName variety: aVariety [
	^ self new
		name: aName;
		variety: aVariety;
		yourself
]

{ #category : #accessing }
Variety >> name [
	^ name
]

{ #category : #accessing }
Variety >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Variety >> taxonomicName [
	^ taxonomicName
]

{ #category : #accessing }
Variety >> taxonomicName: anObject [
	taxonomicName := anObject
]

{ #category : #accessing }
Variety >> variety [
	^ variety
]

{ #category : #accessing }
Variety >> variety: anObject [
	variety := anObject
]

{ #category : #accessing }
Variety >> vulgarName [
	^ vulgarName
]

{ #category : #accessing }
Variety >> vulgarName: anObject [
	vulgarName := anObject
]
