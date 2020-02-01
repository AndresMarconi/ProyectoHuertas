Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMSowingComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad' . 'Superficie (m2)'}
]

{ #category : #rendering }
FOMSowingComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element variety vulgarName.
	element surface.
	element quantity}
]

{ #category : #callbacks }
FOMSowingComponent >> editElement: element [
	(self call: (SowingEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMSowingComponent >> elements [
	^ (self session sowings) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMSowingComponent >> printOn: aStream [
	aStream nextPutAll: 'Siembras'
]
