Class {
	#name : #ActiveIngredient,
	#superclass : #FOMObject,
	#instVars : [
		'tradeName',
		'referenceUrl',
		'senasaApplicabilityRecords'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
ActiveIngredient class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
ActiveIngredient >> addSenasaApplicabilityRecord: aSenasaApplicabilityRecord [
	| existingRecord |
	existingRecord := senasaApplicabilityRecords
		detect: [ :each | 
			each crop = aSenasaApplicabilityRecord crop
				& (each activeIngredient = aSenasaApplicabilityRecord activeIngredient) ]
		ifNone: [ nil ].
	existingRecord notNil
		ifTrue: [ existingRecord
				alertOfPotencialDuplicateWith: aSenasaApplicabilityRecord.
			existingRecord mergeFrom: aSenasaApplicabilityRecord ]
		ifFalse: [ senasaApplicabilityRecords add: aSenasaApplicabilityRecord ]
]

{ #category : #accessing }
ActiveIngredient >> applicabilities [
	^ (senasaApplicabilityRecords
		flatCollect: [ :each | each applicabilities ]) asSet
]

{ #category : #'as yet unclassified' }
ActiveIngredient >> exportToJson [ 
	^ '{ "tradeName" : " ' ,  tradeName ,  ' " }'
]

{ #category : #initialization }
ActiveIngredient >> initialize [
	super initialize.
	senasaApplicabilityRecords := OrderedCollection new
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
ActiveIngredient >> registeredCrops [
	^senasaApplicabilityRecords collect: #crop
]

{ #category : #accessing }
ActiveIngredient >> senasaApplicabilityRecords [
	^ senasaApplicabilityRecords
]

{ #category : #accessing }
ActiveIngredient >> tradeName [
	^ tradeName
]

{ #category : #accessing }
ActiveIngredient >> tradeName: anObject [
	tradeName := anObject
]
