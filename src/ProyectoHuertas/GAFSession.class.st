Class {
	#name : #GAFSession,
	#superclass : #WAOpenIdConnectSession,
	#instVars : [
		'user',
		'farm'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #user }
GAFSession >> authenticatedUser: aDictionary [
	super authenticatedUser: aDictionary.
	user := self findOrCreateUserFromClaims: aDictionary
]

{ #category : #accessing }
GAFSession >> farm [
	"the currently selected farm"

	^ user farms ifNotEmpty: [ :farms | farms first ] ifEmpty: [ nil ]
]

{ #category : #user }
GAFSession >> findOrCreateUserFromClaims: aJsonWebSignature [
	self halt.
	^ self gapAFarm users
		detect: [ :each | each email = (self session authenticatedUser at: 'email') ]
		ifNone:
			[ self gapAFarm createUserResourcesFor: self session authenticatedUser ]
]

{ #category : #accessing }
GAFSession >> gapAFarm [
	^ GapAFarm singleton
]

{ #category : #testing }
GAFSession >> loginRequired [
	"true if loginApp prefference has been set, and the session has not been authenticated"

	^ (self application preferenceAt: #loginApp) notEmpty
		& self authenticated not
]

{ #category : #testing }
GAFSession >> showArchived [
	^ false
]

{ #category : #accessing }
GAFSession >> user [ 
	^ user
]
