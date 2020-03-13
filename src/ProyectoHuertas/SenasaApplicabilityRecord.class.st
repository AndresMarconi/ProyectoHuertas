Class {
	#name : #SenasaApplicabilityRecord,
	#superclass : #Object,
	#instVars : [
		'activeIngredient',
		'usage',
		'crop',
		'residue',
		'postHarvest'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #constants }
SenasaApplicabilityRecord class >> normalizedUsages [
	^ #('Acaricida' 'Antibiótico' 'Antiescaldante' 'Coadyuvante' 'Defoliante' 'Desecante' 'Feromona' 'Fitoregulador' 'Fungicida' 'Gorgojicida' 'Herbicida' 'Insecticida' 'Molusquicida' 'Nematicida' 'Preservador de madera' 'Repelente' 'Rodenticida' 'Tratamiento de semillas' 'Tucuricida')
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
SenasaApplicabilityRecord >> crop [
	^ crop
]

{ #category : #accessing }
SenasaApplicabilityRecord >> crop: anObject [
	crop := anObject
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

{ #category : #accessing }
SenasaApplicabilityRecord >> usage [
	^ usage
]

{ #category : #accessing }
SenasaApplicabilityRecord >> usage: anObject [
	usage := anObject
]
