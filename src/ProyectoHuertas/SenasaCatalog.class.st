Class {
	#name : #SenasaCatalog,
	#superclass : #Object,
	#instVars : [
		'records',
		'activeIngredients',
		'crops',
		'applicabilities'
	],
	#classInstVars : [
		'twentyTwenty'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
SenasaCatalog class >> fromTuples: aCollectionOfTuples [
	^ self new
		fromTuples: aCollectionOfTuples;
		yourself
]

{ #category : #accessing }
SenasaCatalog class >> twentyTwenty [
	^ SenasaCatalog
		fromTuples:
			(NeoCSVReader on: FOMLibrary new lmrsfebrero2020Csv readStream)
				upToEnd
]

{ #category : #converting }
SenasaCatalog >> activeIngredientNamed: aString [
	| name |
	name := aString ifNil: [ 'N/A' ] ifNotNil: [ aString trimBoth ].
	^ activeIngredients
		at: name
		ifAbsentPut: (ActiveIngredient new tradeName: name)
]

{ #category : #accessing }
SenasaCatalog >> activeIngredients [
	^ activeIngredients
]

{ #category : #accessing }
SenasaCatalog >> applicabilities [
	^ applicabilities
]

{ #category : #converting }
SenasaCatalog >> applicabilityFrom: aString [
	| applicabilitiesInString |
	applicabilitiesInString := (aString copyWithoutAll: {$( . $)})
		splitOn:
			{$-.
			Character space}.
	applicabilitiesInString := applicabilitiesInString
		collect: [ :each | 
			(self
				fixTyposIn: (self expandAbbreviationIn: each asLowercase trimBoth))
				 ].
	^ applicabilitiesInString
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

{ #category : #accessing }
SenasaCatalog >> crops [
	^ crops
]

{ #category : #converting }
SenasaCatalog >> expandAbbreviationIn: each [
	^ SenasaApplicabilityRecord normalizedApplicabilities
		at: each
		ifAbsent: [ each ]
]

{ #category : #converting }
SenasaCatalog >> fixTyposIn: each [
	each = 'funguicida'
		ifTrue: [ ^ 'fungicida' ].
	each = 'antidoto de herbicida'
		ifTrue: [ ^ 'antídoto de herbicida' ].
	each = 'trat de suelos'
		ifTrue: [ ^ 'tratamiento de suelos' ].
	each = 'tratamiento semillas'
		ifTrue: [ ^ 'tratamiento de semillas' ].
	each = 'tormiquicida'
		ifTrue: [ ^ 'tormiguicida' ].
	^ each
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
	applicabilities := Bag new.
]

{ #category : #utility }
SenasaCatalog >> misalignedRecords [
	"returns all records that state an applicability not aligned to the SenasaApplicabilityRecord normalizedApplicabilities"

	^ records
		reject: [ :each | 
			SenasaApplicabilityRecord normalizedApplicabilities values
				includesAll: each applicabilities ]
]

{ #category : #converting }
SenasaCatalog >> recordFrom: aTuple [
	aTuple first isNil
		ifTrue: [ ^ nil ].
	^ SenasaApplicabilityRecord new
		activeIngredient: (self activeIngredientNamed: aTuple first);
		applicabilities: (self applicabilityFrom: aTuple second);
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
