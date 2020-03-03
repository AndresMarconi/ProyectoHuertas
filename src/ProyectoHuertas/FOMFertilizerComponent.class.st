Class {
	#name : #FOMFertilizerComponent,
	#superclass : #FOMSubstancesComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMFertilizerComponent >> printOn: aStream [
	aStream nextPutAll: 'Fertilizantes'
]
