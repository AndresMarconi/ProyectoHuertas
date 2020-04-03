Class {
	#name : #GAFSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'farm'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #accessing }
GAFSession >> farm [
	"the currently selected farm"

	^ farm ifNil: [ user farms first ]
]

{ #category : #accessing }
GAFSession >> farm: anObject [
	farm := anObject
]

{ #category : #accessing }
GAFSession >> gapAFarm [
	^ GapAFarm singleton
]

{ #category : #testing }
GAFSession >> isAdmin [
	^ (self application preferenceAt: #adminEmail) trimBoth = user email
]

{ #category : #testing }
GAFSession >> loginRequired [
	"true if loginApp prefference has been set, and the session has not been authenticated"

	^ user isNil
]

{ #category : #testing }
GAFSession >> logout [
	user := nil
]

{ #category : #accessing }
GAFSession >> user [ 
	^ user
]

{ #category : #accessing }
GAFSession >> user: anObject [
	user := anObject
]
