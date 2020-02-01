Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMHarvestComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }
]

{ #category : #rendering }
FOMHarvestComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element variety vulgarName.
	element surface.
	element quantity}
]

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> editElement: element [
	(self call: (HarvestingEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> elements [
	^ (self session harvestings) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMHarvestComponent >> printOn: aStream [
	aStream nextPutAll: 'Cosechas'
]
