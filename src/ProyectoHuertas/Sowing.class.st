Class {
	#name : #Sowing,
	#superclass : #Event,
	#instVars : [
		'conductionSystem',
		'quantity',
		'distribution',
		'variety'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance creation' }
Sowing class >> conductionSystem: conductionSystem quantity: quantity distribution: distribution variety: variety date: date surface: surface [
	^ self new
		conductionSystem: conductionSystem;
		quantity: quantity;
		distribution: distribution;
		variety: variety;
		date: date;
		surface: surface;
		yourself
]

{ #category : #testing }
Sowing class >> isVoyageRoot [
	^ true
]

{ #category : #accessing }
Sowing >> conductionSystem [
	^ conductionSystem
]

{ #category : #accessing }
Sowing >> conductionSystem: anObject [
	conductionSystem := anObject
]

{ #category : #accessing }
Sowing >> distribution [
	^ distribution
]

{ #category : #accessing }
Sowing >> distribution: anObject [
	distribution := anObject
]

{ #category : #accessing }
Sowing >> quantity [
	^ quantity
]

{ #category : #accessing }
Sowing >> quantity: anObject [
	quantity := anObject
]

{ #category : #accessing }
Sowing >> variety [
	^ variety
]

{ #category : #accessing }
Sowing >> variety: anObject [
	variety := anObject
]
