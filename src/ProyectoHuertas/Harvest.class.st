Class {
	#name : #Harvest,
	#superclass : #Event,
	#instVars : [
		'quantity',
		'sowing'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Harvest class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Harvest class >> newWithSowing: aSowing Quantity: aQuantity Date: aDate Surface: aSurface [
	| harvest |
	harvest  := self new.
	^ harvest 
		sowing: aSowing;
		quantity: aQuantity;
		date: aDate;
		surface: aSurface
]

{ #category : #accessing }
Harvest >> quantity [
	^ quantity
]

{ #category : #accessing }
Harvest >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
Harvest >> sowing [
	^ sowing
]

{ #category : #accessing }
Harvest >> sowing: anObject [
	sowing := anObject
]
