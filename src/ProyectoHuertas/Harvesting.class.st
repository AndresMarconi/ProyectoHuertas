Class {
	#name : #Harvesting,
	#superclass : #Event,
	#instVars : [
		'quantity',
		'variety'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Harvesting class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Harvesting class >> newWithSowing: aSowing Quantity: aQuantity Date: aDate Surface: aSurface [
	| harvest |
	harvest  := self new.
	^ harvest 
		sowing: aSowing;
		quantity: aQuantity;
		date: aDate;
		surface: aSurface
]

{ #category : #'instance creation' }
Harvesting class >> variety: aVariety quantity: aQuantity date: aDate [
	^ self new
		quantity: aQuantity;
		variety: aVariety;
		date: aDate;
		yourself
]

{ #category : #testing }
Harvesting >> isEvent: aName [
	^ aName = 'harvest'
]

{ #category : #accessing }
Harvesting >> quantity [
	^ quantity
]

{ #category : #accessing }
Harvesting >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
Harvesting >> sowing [
	^ sowing
]

{ #category : #accessing }
Harvesting >> sowing: anObject [
	sowing := anObject
]

{ #category : #accessing }
Harvesting >> variety [
	^ variety
]

{ #category : #accessing }
Harvesting >> variety: anObject [
	variety := anObject
]
