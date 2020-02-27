Class {
	#name : #Sowing,
	#superclass : #Event,
	#instVars : [
		'conductionSystem',
		'quantity',
		'distribution',
		'variety',
		'timeToHarvest'
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
Sowing class >> typeDescriptor [
	^ 'Siembra'
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

{ #category : #printing }
Sowing >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForSowing: self
]

{ #category : #accessing }
Sowing >> timeToHarvest [
	^ timeToHarvest
]

{ #category : #accessing }
Sowing >> timeToHarvest: anObject [
	timeToHarvest := anObject
]

{ #category : #accessing }
Sowing >> variety [
	^ variety
]

{ #category : #accessing }
Sowing >> variety: anObject [
	variety := anObject
]
