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
Harvesting class >> variety: aVariety quantity: aQuantity date: aDate [
	^ self new
		quantity: aQuantity;
		variety: aVariety;
		date: aDate;
		archived: true;
		yourself
]

{ #category : #'as yet unclassified' }
Harvesting >> classRow [
	^ 'list-group-item-warning'
]

{ #category : #'submorphs-add/remove' }
Harvesting >> delete [ 
	archived:= false.
]

{ #category : #'as yet unclassified' }
Harvesting >> editor [ 
	^ HarvestingEditor subject: self
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

{ #category : #'as yet unclassified' }
Harvesting >> rowText [
	^ 'Cosecha de ',(self variety vulgarName)
]

{ #category : #accessing }
Harvesting >> variety [
	^ variety
]

{ #category : #accessing }
Harvesting >> variety: anObject [
	variety := anObject
]
