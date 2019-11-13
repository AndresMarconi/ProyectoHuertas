Class {
	#name : #Sowing,
	#superclass : #Event,
	#instVars : [
		'system',
		'plantsQuantity',
		'distribution',
		'product'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Sowing class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Sowing class >> newWithProduct: aProduct System: aSystem Distribution: aDist PQ: pq Date: aDate Surface: aSurface [
	| sowing |
	sowing := self new.
	^ sowing
		product: aProduct;
		system: aSystem;
		plantsQuantity: pq;
		distribution: aDist;
		date: aDate;
		surface: aSurface
 
]

{ #category : #accessing }
Sowing >> distribution [
	^ distribution
]

{ #category : #accessing }
Sowing >> distribution: anObject [
	distribution := anObject
]

{ #category : #testing }
Sowing >> isEvent: aName [
	^ aName = 'sowing'
]

{ #category : #accessing }
Sowing >> plantsQuantity [
	^ plantsQuantity
]

{ #category : #accessing }
Sowing >> plantsQuantity: anObject [
	plantsQuantity := anObject
]

{ #category : #accessing }
Sowing >> product [
	^ product
]

{ #category : #accessing }
Sowing >> product: anObject [
	product := anObject
]

{ #category : #accessing }
Sowing >> system [
	^ system
]

{ #category : #accessing }
Sowing >> system: anObject [
	system := anObject
]
