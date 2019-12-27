Class {
	#name : #FOMSession,
	#superclass : #WAOpenIdConnectSession,
	#instVars : [
		'user',
		'farm'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMSession >> aplications [
	^ self plots flatCollect: [ :each | each aplications ]
]

{ #category : #accessing }
FOMSession >> authenticatedUser: aDictionary [
	super authenticatedUser: aDictionary.
	user := self findOrCreateUserFromClaims: aDictionary
]

{ #category : #'creating-users' }
FOMSession >> createUserResources [
	| aUser aFarm |
	aUser := FOMUser fromOIDCUser: self session authenticatedUser.
	aFarm := Farm name: 'Granja de ' , aUser fullname.
	aFarm save.
	aUser addFarm: aFarm.
	aUser save.
	^ aUser
]

{ #category : #accessing }
FOMSession >> farm [
	"the currently selected farm"

	^ farm ifNil: [ farm := self user farms first ]
]

{ #category : #accessing }
FOMSession >> farms [
	user ifNil: [ ^ Set new ].
	^ user farms
]

{ #category : #'creating-users' }
FOMSession >> findOrCreateUserFromClaims: aDictionary [
	user := self session users
		detect: [ :each | each email = (self session authenticatedUser at: 'email') ]
		ifNone: [ self createUserResources ]
]

{ #category : #accessing }
FOMSession >> harvestings [ 
	^ self plots flatCollect: [ :each | each harvests ]
]

{ #category : #testing }
FOMSession >> loginRequired [
	"true if loginApp prefference has been set, and the session has not been authenticated"

	^ (self application preferenceAt: #loginApp) notEmpty
		& self authenticated not
]

{ #category : #accessing }
FOMSession >> plots [
	^ farm ifNil: [ self farms flatCollect: [ :each | each plots ] ] ifNotNil: [ farm plots ]
]

{ #category : #accessing }
FOMSession >> problems [
	^ self plots flatCollect: [ :each | each problems ]
]

{ #category : #accessing }
FOMSession >> sales [
	user ifNil: [ ^ OrderedCollection new ].
	^ user sales
]

{ #category : #accessing }
FOMSession >> sowings [  
	^ self plots flatCollect: [ :each | each sowings ]
]

{ #category : #accessing }
FOMSession >> stock [
	user ifNil: [ ^ OrderedCollection new ].
	^ user stock
]

{ #category : #accessing }
FOMSession >> substances [
	^ Substance selectMany: [ :each | each archived not]
]

{ #category : #accessing }
FOMSession >> user [ 
	^ user
]

{ #category : #accessing }
FOMSession >> users [
	^ (FOMUser selectMany: [ :each | each archived not ])
		asSortedCollection: [ :u1 :u2 | u1 firstName > u2 firstName ]
]

{ #category : #accessing }
FOMSession >> varieties [
	^ Variety selectMany: [ :each | each archived not ]
]
