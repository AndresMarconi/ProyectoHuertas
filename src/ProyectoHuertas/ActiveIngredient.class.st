Class {
	#name : #ActiveIngredient,
	#superclass : #FOMObject,
	#instVars : [
		'tradeName',
		'referenceUrl',
		'applicabilities'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
ActiveIngredient class >> isVoyageRoot [
	^ true
]

{ #category : #acccessing }
ActiveIngredient >> addApplicabilities: aCollection [
	applicabilities addAll: aCollection
]

{ #category : #acccessing }
ActiveIngredient >> addApplicability: aString [
	applicabilities add: aString
	
]

{ #category : #acccessing }
ActiveIngredient >> applicabilities [
	^ applicabilities
]

{ #category : #'as yet unclassified' }
ActiveIngredient >> exportToJson [ 
	^ '{ "tradeName" : "' ,  tradeName ,  '" }'
]

{ #category : #initialization }
ActiveIngredient >> initialize [
	super initialize.
	applicabilities := Set new
]

{ #category : #printing }
ActiveIngredient >> printOn: aStream [
	^ aStream
		nextPutAll: (self tradeName).
]

{ #category : #accessing }
ActiveIngredient >> referenceUrl [
	^ referenceUrl
]

{ #category : #accessing }
ActiveIngredient >> referenceUrl: anObject [
	referenceUrl := anObject
]

{ #category : #accessing }
ActiveIngredient >> tradeName [
	^ tradeName
]

{ #category : #accessing }
ActiveIngredient >> tradeName: anObject [
	tradeName := anObject
]
