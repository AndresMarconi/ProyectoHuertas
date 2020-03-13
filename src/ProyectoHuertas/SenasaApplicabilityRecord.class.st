Class {
	#name : #SenasaApplicabilityRecord,
	#superclass : #Object,
	#instVars : [
		'activeIngredient',
		'crop',
		'residue',
		'postHarvest',
		'applicabilities'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #constants }
SenasaApplicabilityRecord class >> normalizedApplicabilities [
	^ {('tt' -> 'tratamiento de semillas').
	('ah' -> 'antídoto de herbicidas').
	('baA' -> 'bactericida').
	('fr' -> 'fitorreguladores').
	('he' -> 'herbicida').
	('fu' -> 'fungicida').
	('in' -> 'insecticida').
	('ac' -> 'acaricida').
	('ne' -> 'nematicida').
	('go' -> 'gorgojicida').
	('rd' -> 'rodenticida').
	('mo' -> 'molusquicida').
	('tu' -> 'tucuricida').
	('ma' -> 'matababosas y caracoles').
	('pm' -> 'preservador de madera').
	('ho' -> 'hormiguicida')} asDictionary
]

{ #category : #accessing }
SenasaApplicabilityRecord >> activeIngredient [
	^ activeIngredient
]

{ #category : #accessing }
SenasaApplicabilityRecord >> activeIngredient: anObject [
	activeIngredient := anObject
]

{ #category : #accessing }
SenasaApplicabilityRecord >> applicabilities [
	^ applicabilities
]

{ #category : #accessing }
SenasaApplicabilityRecord >> applicabilities: anObject [
	applicabilities := anObject
]

{ #category : #accessing }
SenasaApplicabilityRecord >> crop [
	^ crop
]

{ #category : #accessing }
SenasaApplicabilityRecord >> crop: anObject [
	crop := anObject
]

{ #category : #initialization }
SenasaApplicabilityRecord >> initialize [
	applicabilities := OrderedCollection new
]

{ #category : #accessing }
SenasaApplicabilityRecord >> postHarvest [
	^ postHarvest
]

{ #category : #accessing }
SenasaApplicabilityRecord >> postHarvest: anObject [
	postHarvest := anObject
]

{ #category : #accessing }
SenasaApplicabilityRecord >> residue [
	^ residue
]

{ #category : #accessing }
SenasaApplicabilityRecord >> residue: anObject [
	residue := anObject
]
