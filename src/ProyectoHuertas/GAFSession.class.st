Class {
	#name : #GAFSession,
	#superclass : #WAOpenIdConnectSession,
	#instVars : [
		'user',
		'farm',
		'plot'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'db queries' }
GAFSession >> activeIngredients [

	^ (ActiveIngredient selectMany: [ :each | each archived = false ])
		asOrderedCollection
]

{ #category : #'indirect queries' }
GAFSession >> aplications [
	^ self plots flatCollect: [ :each | each aplications ]
]

{ #category : #user }
GAFSession >> authenticatedUser: aDictionary [
	super authenticatedUser: aDictionary.
	user := self findOrCreateUserFromClaims: aDictionary
]

{ #category : #user }
GAFSession >> createUserResources [
	| aUser |
	aUser := GAFUser fromOIDCUser: self session authenticatedUser.
	aUser
		addFarm: (self findOrCreateFarmNamed: 'Granja de ' , aUser email).
	aUser save.
	^ aUser
]

{ #category : #'db queries' }
GAFSession >> cropNamed: aName [
	^ (Crop
		selectMany: [ :each | each archived = false & (each vulgarName = aName) ])
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #'db queries' }
GAFSession >> crops [
	^ (Crop selectMany: [ :each | each archived = false ])
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #accessing }
GAFSession >> farm [
	"the currently selected farm"

	^ farm
		ifNil: [ farm := user
				ifNotNil: [ user farms ifNotEmpty: [ :farms | farms first ] ifEmpty: [ nil ] ] ]
		ifNotNil: [ farm ]
]

{ #category : #'db queries' }
GAFSession >> farmNamed: aName [
	^ Farm selectOne: [ :each | each name = aName ]
]

{ #category : #'indirect queries' }
GAFSession >> farms [
	user ifNil: [ ^ Set new ].
	^ user farms
]

{ #category : #user }
GAFSession >> findOrCreateFarmNamed: aName [
	| aFarm |
	aFarm := self session farmNamed: aName.
	aFarm
		ifNil: [ aFarm := Farm name: aName.
			aFarm save ].
	^ aFarm
]

{ #category : #user }
GAFSession >> findOrCreateUserFromClaims: aDictionary [
	^ self session users
		detect: [ :each | each email = (self session authenticatedUser at: 'email') ]
		ifNone: [ self createUserResources ]
]

{ #category : #'indirect queries' }
GAFSession >> harvestings [ 
	^ self plots flatCollect: [ :each | each harvests ]
]

{ #category : #'indirect queries' }
GAFSession >> inventoryItems [
	^ self farm ifNotNil: [ :it | it inventoryItems ] ifNil: [ Set new ]
]

{ #category : #testing }
GAFSession >> loginRequired [
	"true if loginApp prefference has been set, and the session has not been authenticated"

	^ (self application preferenceAt: #loginApp) notEmpty
		& self authenticated not
]

{ #category : #'indirect queries' }
GAFSession >> plots [
	^ self farm
		ifNotNil:
			[ :it | it plots asSortedCollection: [ :before :after | before id < after id ] ]
		ifNil: [ Set new ]
]

{ #category : #'indirect queries' }
GAFSession >> problems [
	^ self plots flatCollect: [ :each | each problems ]
]

{ #category : #'db queries' }
GAFSession >> registeredCropsForActiveIngredient: activeIngrediente [
	^ (SenasaCatalogue singleton
		registeredCropNamesForActiveIngredient: activeIngrediente tradeName)
		flatCollect: [ :cropName | self cropNamed: cropName ]
]

{ #category : #'indirect queries' }
GAFSession >> sales [
	^ self farm ifNil: [ Array new ] ifNotNil: [ :it | it sales ]
]

{ #category : #accessing }
GAFSession >> selectPlot: aPlot [
	plot := aPlot.
]

{ #category : #accessing }
GAFSession >> selectedPlot [
	^plot
]

{ #category : #'db queries' }
GAFSession >> senasaApplicabilityRecords [
	self notYetImplemented
]

{ #category : #'db queries' }
GAFSession >> senasaApplicabilityRecordsForActiveIngredient: anActiveIngrediente [
	^ 	self notYetImplemented
]

{ #category : #'db queries' }
GAFSession >> senasaApplicabilityRecordsForCrop: aCrop [
	^ 	self notYetImplemented
]

{ #category : #testing }
GAFSession >> showArchived [
	^ false
]

{ #category : #'indirect queries' }
GAFSession >> sowings [  
	^ self plots flatCollect: [ :each | each sowings ]
]

{ #category : #'db queries' }
GAFSession >> substances [
	^ (Substance selectMany: [ :each | each archived = false ])
		asSortedCollection: [ :a :b | a comercialName < b comercialName ]
]

{ #category : #translation }
GAFSession >> translationDomain [
	^ 'fom'
]

{ #category : #translation }
GAFSession >> translationLocale [
	^ LocaleID isoString: 'es-AR'.
]

{ #category : #accessing }
GAFSession >> user [ 
	^ user
]

{ #category : #'db queries' }
GAFSession >> users [
	^ GAFUser selectMany: [ :each | each archived = false ]
]
