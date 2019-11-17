Class {
	#name : #ExampleObjectToEdit,
	#superclass : #Object,
	#instVars : [
		'fullName',
		'birthDate',
		'weight',
		'cv',
		'favoriteClass'
	],
	#category : #'ProyectoHuertas-widgets-examples'
}

{ #category : #accessing }
ExampleObjectToEdit >> birthDate [
	^ birthDate
]

{ #category : #accessing }
ExampleObjectToEdit >> birthDate: anObject [
	birthDate := anObject
]

{ #category : #accessing }
ExampleObjectToEdit >> cv [
	^ cv
]

{ #category : #accessing }
ExampleObjectToEdit >> cv: anObject [
	cv := anObject
]

{ #category : #accessing }
ExampleObjectToEdit >> favoriteClass [
	^ favoriteClass
]

{ #category : #accessing }
ExampleObjectToEdit >> favoriteClass: anObject [
	favoriteClass := anObject
]

{ #category : #accessing }
ExampleObjectToEdit >> fullName [
	^ fullName
]

{ #category : #accessing }
ExampleObjectToEdit >> fullName: anObject [
	fullName := anObject
]

{ #category : #accessing }
ExampleObjectToEdit >> weight [
	^ weight
]

{ #category : #accessing }
ExampleObjectToEdit >> weight: anObject [
	weight := anObject
]
