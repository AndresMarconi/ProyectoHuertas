Class {
	#name : #FOMSession,
	#superclass : #WAOpenIdConnectSession,
	#instVars : [
		'user',
		'farm',
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

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
	| aUser  |
	aUser := FOMUser fromOIDCUser: self session authenticatedUser.
	aUser addFarm: (self findOrCreateFarmNamed: 'Serviverde').
	aUser save.
	^ aUser
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

{ #category : #testing }
FOMSession >> loginRequired [
	"true if loginApp prefference has been set, and the session has not been authenticated"

	^ (self application preferenceAt: #loginApp) notEmpty
		& self authenticated not
]

{ #category : #'indirect queries' }
FOMSession >> plots [
	^ self farm ifNotNil: [ :it | it plots ] ifNil: [ Set new ]
]

{ #category : #'indirect queries' }
FOMSession >> problems [
	^ self plots flatCollect: [ :each | each problems ]
]

{ #category : #'indirect queries' }
FOMSession >> sales [
	user ifNil: [ ^ OrderedCollection new ].
	^ user sales
]

{ #category : #'as yet unclassified' }
FOMSession >> selectPlot: aPlot [
	plot := aPlot.
]

{ #category : #'as yet unclassified' }
FOMSession >> selectedPlot [
	^plot
]

{ #category : #testing }
FOMSession >> showArchived [
	^ false
]

{ #category : #'indirect queries' }
FOMSession >> sowings [  
	^ self plots flatCollect: [ :each | each sowings ]
]

{ #category : #'indirect queries' }
FOMSession >> stock [
	user ifNil: [ ^ OrderedCollection new ].
	^ user stock
]

{ #category : #'db queries' }
FOMSession >> substances [
	^ Substance selectMany: [ :each | each archived = false]
]

{ #category : #accessing }
FOMSession >> user [ 
	^ user
]

{ #category : #'db queries' }
FOMSession >> users [
	^ FOMUser selectMany: [ :each | each archived = false ]
]

{ #category : #'db queries' }
FOMSession >> varieties [
	^ Variety selectMany: [ :each | each archived = false ]
]
