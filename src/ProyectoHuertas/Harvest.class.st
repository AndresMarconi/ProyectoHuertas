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
