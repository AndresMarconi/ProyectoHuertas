Class {
	#name : #FOMSession,
	#superclass : #WAOpenIdConnectSession,
	#instVars : [
		'user',
		'farm',
		'plot'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'db queries' }
FOMSession >> activeIngredients [

	^ (ActiveIngredient selectMany: [ :each | each archived = false ])
		asOrderedCollection
]

{ #category : #'indirect queries' }
FOMSession >> aplications [
	^ self plots flatCollect: [ :each | each aplications ]
]

{ #category : #user }
FOMSession >> authenticatedUser: aDictionary [
	super authenticatedUser: aDictionary.
	user := self findOrCreateUserFromClaims: aDictionary
]

{ #category : #user }
FOMSession >> createUserResources [
	| aUser |
	aUser := FOMUser fromOIDCUser: self session authenticatedUser.
	aUser
		addFarm: (self findOrCreateFarmNamed: 'Granja de ' , aUser email).
	aUser save.
	^ aUser
]

{ #category : #'db queries' }
FOMSession >> crops [
	^ (Crop selectMany: [ :each | each archived = false ])
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #accessing }
FOMSession >> farm [
	"the currently selected farm"

	^ farm
		ifNil: [ farm := user
				ifNotNil: [ user farms ifNotEmpty: [ :farms | farms first ] ifEmpty: [ nil ] ] ]
		ifNotNil: [ farm ]
]

{ #category : #'db queries' }
FOMSession >> farmNamed: aName [
	^ Farm selectOne: [ :each | each name = aName ]
]

{ #category : #'indirect queries' }
FOMSession >> farms [
	user ifNil: [ ^ Set new ].
	^ user farms
]

{ #category : #user }
FOMSession >> findOrCreateFarmNamed: aName [
	| aFarm |
	aFarm := self session farmNamed: aName.
	aFarm
		ifNil: [ aFarm := Farm name: aName.
			aFarm save ].
	^ aFarm
]

{ #category : #user }
FOMSession >> findOrCreateUserFromClaims: aDictionary [
	^ self session users
		detect: [ :each | each email = (self session authenticatedUser at: 'email') ]
		ifNone: [ self createUserResources ]
]

{ #category : #'indirect queries' }
FOMSession >> harvestings [ 
	^ self plots flatCollect: [ :each | each harvests ]
]

{ #category : #'indirect queries' }
FOMSession >> inventoryItems [
	^ self farm ifNotNil: [ :it | it inventoryItems ] ifNil: [ Set new ]
]

{ #category : #testing }
FOMSession >> loginRequired [
	"true if loginApp prefference has been set, and the session has not been authenticated"

	^ (self application preferenceAt: #loginApp) notEmpty
		& self authenticated not
]

{ #category : #'indirect queries' }
FOMSession >> plots [
	^ self farm
		ifNotNil:
			[ :it | it plots asSortedCollection: [ :before :after | before id < after id ] ]
		ifNil: [ Set new ]
]

{ #category : #'indirect queries' }
FOMSession >> problems [
	^ self plots flatCollect: [ :each | each problems ]
]

{ #category : #'db queries' }
FOMSession >> registeredCropsForActiveIngredient: activeIngrediente [
	| cropNames |
	cropNames := SenasaCatalog singleton
		registeredCropNamesForActiveIngredient: activeIngrediente tradeName
]

{ #category : #'indirect queries' }
FOMSession >> sales [
	^ self farm ifNil: [ Array new ] ifNotNil: [ :it | it sales ]
]

{ #category : #accessing }
FOMSession >> selectPlot: aPlot [
	plot := aPlot.
]

{ #category : #accessing }
FOMSession >> selectedPlot [
	^plot
]

{ #category : #'db queries' }
FOMSession >> senasaApplicabilityRecords [
	self notYetImplemented
]

{ #category : #'db queries' }
FOMSession >> senasaApplicabilityRecordsForActiveIngredient: anActiveIngrediente [
	^ 	self notYetImplemented
]

{ #category : #'db queries' }
FOMSession >> senasaApplicabilityRecordsForCrop: aCrop [
	^ 	self notYetImplemented
]

{ #category : #testing }
FOMSession >> showArchived [
	^ false
]

{ #category : #'indirect queries' }
FOMSession >> sowings [  
	^ self plots flatCollect: [ :each | each sowings ]
]

{ #category : #'db queries' }
FOMSession >> substances [
	^ (Substance selectMany: [ :each | each archived = false ])
		asSortedCollection: [ :a :b | a comercialName < b comercialName ]
]

{ #category : #translation }
FOMSession >> translationDomain [
	^ 'fom'
]

{ #category : #translation }
FOMSession >> translationLocale [
	^ LocaleID isoString: 'es-AR'.
]

{ #category : #accessing }
FOMSession >> user [ 
	^ user
]

{ #category : #'db queries' }
FOMSession >> users [
	^ FOMUser selectMany: [ :each | each archived = false ]
]
