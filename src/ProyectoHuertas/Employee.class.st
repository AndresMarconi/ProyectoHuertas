Class {
	#name : #Employee,
	#superclass : #Object,
	#instVars : [
		'name',
		'surname',
		'password'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Employee class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Employee >> name [
	^ name
]

{ #category : #accessing }
Employee >> name: anObject [
	name := anObject
]

{ #category : #accessing }
Employee >> password [
	^ password
]

{ #category : #accessing }
Employee >> password: anObject [
	password := anObject
]

{ #category : #accessing }
Employee >> surname [
	^ surname
]

{ #category : #accessing }
Employee >> surname: anObject [
	surname := anObject
]
