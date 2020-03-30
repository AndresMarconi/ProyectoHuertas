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

{ #category : #private }
GapAFarm >> createUserResourcesFor: aGAFUser [
	| farm |
	farm := self findOrCreateFarmNamed: 'Granja de ' , aGAFUser fullname.
	farm save.
	aGAFUser
		addFarm: farm;
		save;
		yourself
]

{ #category : #'db queries' }
GapAFarm >> cropNamed: aName [
	^ (Crop selectMany: [ :each | each vulgarName = aName ])
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #'db queries' }
GapAFarm >> crops [
	^ Crop selectAll
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

{ #category : #'factory methods' }
GapAFarm >> register: anEmailAddress withHashedPassword: aHashedPassword andName: aFullName [
	| user |
	user := GAFUser new
		email: anEmailAddress;
		hashedPassword: aHashedPassword;
		fullname: aFullName;
		save;
		yourself.
	self createUserResourcesFor: user.
	^ user
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
GapAFarm >> userWithEmail: anEmailAddress [
	^ GAFUser selectOne: [ :each | each email = anEmailAddress ]
]

{ #category : #'db queries' }
GapAFarm >> users [
	^ GAFUser selectAll
]
