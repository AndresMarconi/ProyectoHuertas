Class {
	#name : #Variety,
	#superclass : #FOMObject,
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
Variety class >> vulgarName: vulgarName taxonomicName: taxonomicName [
	^ self new
		vulgarName: vulgarName;
		taxonomicName: taxonomicName;
		archived: true;
		yourself
]

{ #category : #printing }
Variety >> printOn: aStream [
	^ aStream
		nextPutAll: (self vulgarName).
]

{ #category : #'as yet unclassified' }
Variety >> rowText [
	^ 'variadad ', vulgarName 
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
Variety >> vulgarName [
	^ vulgarName
]

{ #category : #accessing }
Variety >> vulgarName: anObject [
	vulgarName := anObject
]
