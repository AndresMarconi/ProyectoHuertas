Class {
	#name : #SenasaCatalog,
	#superclass : #Object,
	#instVars : [
		'records',
		'activeIngredients',
		'crops',
		'usages'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
SenasaCatalog class >> fromTuples: aCollectionOfTuples [
	^ self new
		fromTuples: aCollectionOfTuples;
		yourself
]

{ #category : #converting }
SenasaCatalog >> activeIngredientNamed: aString [
	| name |
	name := aString ifNil: [ 'N/A' ] ifNotNil: [ aString trimBoth ].
	^ activeIngredients
		at: name
		ifAbsentPut: (ActiveIngredient new tradeName: name)
]

{ #category : #converting }
SenasaCatalog >> asUsageLabel: aString [
	| usage |
	usage := (aString copyWithoutAll: {$( . $)}) trimBoth.
	usages add: usage.
	^ usage
]

{ #category : #converting }
SenasaCatalog >> cropNamed: aString [
	| name |
	aString ifNil: [ ^ nil ].
	name := aString trimBoth.
	name ifEmpty: [ ^ nil ].
	name := name asLowercase capitalized.
	^ crops at: name ifAbsentPut: (Crop new vulgarName: name)
]

{ #category : #converting }
SenasaCatalog >> fromTuples: aCollectionOfTuples [
	"Tuple are #('Principio activo' 'Aptitud' 'Cultivos' 'Residuos (mg /Kg)' 'Post Cosecha')"

	records := (aCollectionOfTuples
		collect: [ :each | self recordFrom: each ]) copyWithout: nil.
]

{ #category : #initialization }
SenasaCatalog >> initialize [
	records := OrderedCollection new.
	crops := Dictionary new.
	activeIngredients := Dictionary new.
	usages := Bag new.
]

{ #category : #converting }
SenasaCatalog >> recordFrom: aTuple [
	aTuple first isNil
		ifTrue: [ ^ nil ].
	^ SenasaApplicabilityRecord new
		activeIngredient: (self activeIngredientNamed: aTuple first);
		usage: (self asUsageLabel: aTuple second);
		crop: (self cropNamed: aTuple third);
		residue: aTuple fourth;
		postHarvest: (aTuple fifth ifNil: [ 'N/A' ])
]

{ #category : #accessing }
SenasaCatalog >> records [
	^ records
]

{ #category : #accessing }
SenasaCatalog >> records: anObject [
	records := anObject
]
