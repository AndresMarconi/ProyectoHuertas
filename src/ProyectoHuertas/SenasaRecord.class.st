Class {
	#name : #SenasaRecord,
	#superclass : #Object,
	#instVars : [
		'cropVulgarName',
		'residue',
		'applicabilities',
		'activeIngredientTradeName'
	],
	#category : #'ProyectoHuertas-senasa'
}

{ #category : #accessing }
SenasaRecord >> activeIngredientTradeName [
	^ activeIngredientTradeName
]

{ #category : #accessing }
SenasaRecord >> activeIngredientTradeName: anObject [
	activeIngredientTradeName := anObject
]

{ #category : #accessing }
SenasaRecord >> applicabilities [
	^ applicabilities
]

{ #category : #accessing }
SenasaRecord >> applicabilities: anObject [
	applicabilities := anObject
]

{ #category : #accessing }
SenasaRecord >> cropVulgarName [
	^ cropVulgarName
]

{ #category : #accessing }
SenasaRecord >> cropVulgarName: anObject [
	cropVulgarName := anObject
]

{ #category : #testing }
SenasaRecord >> hasActiveIngredient [
	^ activeIngredientTradeName notNil
		and: [ activeIngredientTradeName notEmpty ]
]

{ #category : #testing }
SenasaRecord >> hasCrop [
	^ cropVulgarName notNil and: [ cropVulgarName notEmpty ]
]

{ #category : #testing }
SenasaRecord >> isComplete [
	^ self hasActiveIngredient & self hasCrop
]

{ #category : #accessing }
SenasaRecord >> residue [
	^ residue
]

{ #category : #accessing }
SenasaRecord >> residue: anObject [
	residue := anObject
]
