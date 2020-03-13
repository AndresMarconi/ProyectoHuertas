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
SenasaCatalog class >> fromTuples: aCollectionOfTuples withExistingCrops: aCollectionOfCrops andExistingActiveIngredientes: aCollectionOfActiveIngredients [
	^ self new
		fromTuples: aCollectionOfTuples
			withExistingCrops: aCollectionOfCrops
			andExistingActiveIngredientes: aCollectionOfActiveIngredients;
		yourself
]

{ #category : #accessing }
SenasaCatalog class >> twentyTwentyWithExistingCrops: aCollectionOfCrops andExistingActiveIngredientes: aCollectionOfActiveIngredients [
	^ SenasaCatalog
		fromTuples:
			((NeoCSVReader on: FOMLibrary new lmrsfebrero2020Csv readStream)
				skip;
				upToEnd)
		withExistingCrops: aCollectionOfCrops
		andExistingActiveIngredientes: aCollectionOfActiveIngredients
]

{ #category : #private }
SenasaCatalog >> activeIngredientNamed: aString withExistingActiveIngredientes: aCollectionOfActiveIngredients [
	| name |
	aString ifNil: [ ^ nil ].
	name := aString trimBoth asLowercase.
	^ activeIngredients
		at: name
		ifAbsentPut:
			(aCollectionOfActiveIngredients
				detect: [ :each | each tradeName asLowercase = name ]
				ifNone: [ ActiveIngredient new tradeName: name ])
]

{ #category : #accessing }
SenasaCatalog >> activeIngredients [
	^ activeIngredients
]

{ #category : #accessing }
SenasaCatalog >> applicabilities [
	^ applicabilities
]

{ #category : #private }
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

{ #category : #private }
SenasaCatalog >> cropNamed: aString withExistingCrops: aCollectionOfCrops [
	| name |
	aString ifNil: [ ^ nil ].
	name := aString trimBoth.
	name ifEmpty: [ ^ nil ].
	name := name asLowercase capitalized.
	^ crops
		at: name
		ifAbsentPut:
			(aCollectionOfCrops
				detect: [ :each | each vulgarName asLowercase capitalized = name ]
				ifNone: [ Crop new vulgarName: name ])
]

{ #category : #accessing }
SenasaCatalog >> crops [
	^ crops
]

{ #category : #utility }
SenasaCatalog >> expandAbbreviationIn: each [
	^ SenasaApplicabilityRecord normalizedApplicabilities
		at: each
		ifAbsent: [ each ]
]

{ #category : #utility }
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

{ #category : #initialization }
SenasaCatalog >> fromTuples: aCollectionOfTuples withExistingCrops: aCollectionOfCrops andExistingActiveIngredientes: aCollectionOfActiveIngredients [
	"Tuple are #('Principio activo' 'Aptitud' 'Cultivos' 'Residuos (mg /Kg)' 'Post Cosecha')"

	records := aCollectionOfTuples
		collect: [ :each | 
			self
				recordFrom: each
				withExistingCrops: aCollectionOfCrops
				andExistingActiveIngredientes: aCollectionOfActiveIngredients ].
	records := records
		select: [ :each | each notNil and: [ each crop notNil ] ]
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

{ #category : #private }
SenasaCatalog >> recordFrom: aTuple withExistingCrops: aCollectionOfCrops andExistingActiveIngredientes: aCollectionOfActiveIngredients [
	aTuple first isEmptyOrNil 
		ifTrue: [ ^ nil ].
	^ SenasaApplicabilityRecord new
		activeIngredient:
			(self
				activeIngredientNamed: aTuple first
				withExistingActiveIngredientes: aCollectionOfActiveIngredients);
		applicabilities: (self applicabilityFrom: aTuple second);
		crop: (self cropNamed: aTuple third withExistingCrops: aCollectionOfCrops);
		residue: (self residueFrom: aTuple fourth) ;
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

{ #category : #utility }
SenasaCatalog >> residueFrom: aString [
	^ [ aString asNumber ]
		on: Error
		do: [ 0 ]
]
