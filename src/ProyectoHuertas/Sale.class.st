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
		archived: true;
		yourself
]

{ #category : #testing }
Sale class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Sale >> addItem: anObject [
	items := anObject
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

{ #category : #'submorphs-add/remove' }
Sale >> delete [ 
	archived:= false.
	items do: [ :item | item archived: false ]
]

{ #category : #initialization }
Sale >> initialize [
	items := OrderedCollection new.
]

{ #category : #accessing }
Sale >> items [
	^ items
]

{ #category : #'as yet unclassified' }
Sale >> rowText [
	^ 'Venta realizada el ', date asString, ' al cliente ', client
]
