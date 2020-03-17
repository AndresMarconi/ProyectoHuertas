Class {
	#name : #SenasaApplicabilityRecord,
	#superclass : #FOMObject,
	#instVars : [
		'activeIngredient',
		'crop',
		'residue',
		'postHarvest',
		'applicabilities'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #voyage }
SenasaApplicabilityRecord class >> isVoyageRoot [
	^ true
]

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

{ #category : #errors }
SenasaApplicabilityRecord >> alertOfPotencialDuplicateWith: anotherRecord [
	Transcript
		show: 'Duplicados: (merging to existing)';
		cr.
	Transcript
		show: self printString;
		cr.
	Transcript
		show: anotherRecord printString;
		cr
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
	super initialize.
	applicabilities := OrderedCollection new
]

{ #category : #merging }
SenasaApplicabilityRecord >> mergeFrom: anotherRecord [
	applicabilities addAll: anotherRecord applicabilities.
	residue := residue min: anotherRecord residue.
]

{ #category : #accessing }
SenasaApplicabilityRecord >> postHarvest [
	^ postHarvest
]

{ #category : #accessing }
SenasaApplicabilityRecord >> postHarvest: anObject [
	postHarvest := anObject
]

{ #category : #printing }
SenasaApplicabilityRecord >> printOn: aStream [
	aStream
		nextPutAll:
			crop vulgarName , ' - ' , activeIngredient tradeName , ' - '
				, residue printString
]

{ #category : #accessing }
SenasaApplicabilityRecord >> residue [
	^ residue
]

{ #category : #accessing }
SenasaApplicabilityRecord >> residue: anObject [
	residue := anObject
]
