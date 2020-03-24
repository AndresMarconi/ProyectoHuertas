Class {
	#name : #GapAFarm,
	#superclass : #Object,
	#classInstVars : [
		'singleton'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #singleton }
GapAFarm class >> singleton [
	^ singleton ifNil: [ singleton := self new ]
]

{ #category : #'db queries' }
GapAFarm >> activeIngredients [
	^ ActiveIngredient selectAll
		asSortedCollection: [ :a :b | a tradeName < b tradeName ]
]

{ #category : #'factory methods' }
GapAFarm >> createUserResourcesFor: aJsonWebSignature [
	| aUser |
	aUser := GAFUser fromOIDCUser: aJsonWebSignature.
	aUser
		addFarm: (self findOrCreateFarmNamed: 'Granja de ' , aUser email).
	aUser save.
	^ aUser
]

{ #category : #'db queries' }
GapAFarm >> cropNamed: aName [
	^ (Crop
		selectMany: [ :each | each archived = false & (each vulgarName = aName) ])
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #'db queries' }
GapAFarm >> crops [
	^ (Crop selectMany: [ :each | each archived = false ])
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #'db queries' }
GapAFarm >> farmNamed: aName [
	^ Farm selectOne: [ :each | each name = aName ]
]

{ #category : #'factory methods' }
GapAFarm >> findOrCreateFarmNamed: aName [
	| aFarm |
	aFarm := self farmNamed: aName.
	aFarm
		ifNil: [ aFarm := Farm name: aName.
			aFarm save ].
	^ aFarm
]

{ #category : #senasa }
GapAFarm >> registeredCropsForActiveIngredient: activeIngrediente [
	^ (SenasaCatalogue singleton
		registeredCropNamesForActiveIngredient: activeIngrediente tradeName)
		flatCollect: [ :cropName | self cropNamed: cropName ]
]

{ #category : #'db queries' }
GapAFarm >> substances [
	^ Substance selectAll
		asSortedCollection: [ :a :b | a comercialName < b comercialName ]
]

{ #category : #'db queries' }
GapAFarm >> users [
	^ GAFUser selectAll
]
