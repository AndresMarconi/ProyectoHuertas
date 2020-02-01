Class {
	#name : #Sale,
	#superclass : #FOMObject,
	#instVars : [
		'date',
		'client',
		'items'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
Sale class >> client: aClient date: aDate [
	^ self new
		date: aDate;
		client: aClient;
		yourself
]

{ #category : #testing }
Sale class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Sale >> addItem: anObject [
	items add: anObject 
]

{ #category : #archiving }
Sale >> archive [
	super archive.
	items do: #archive
]

{ #category : #accessing }
Sale >> client [
	^ client
]

{ #category : #accessing }
Sale >> client: anObject [
	client := anObject
]

{ #category : #accessing }
Sale >> date [
	^ date
]

{ #category : #accessing }
Sale >> date: anObject [
	date := anObject
]

{ #category : #initialization }
Sale >> initialize [
   super initialize .
	items := OrderedCollection new.
]

{ #category : #accessing }
Sale >> items [
	^ items
]

{ #category : #removing }
Sale >> removeItem: item [
items remove: item.
]
