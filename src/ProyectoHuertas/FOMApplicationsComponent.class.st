Class {
	#name : #FOMApplicationsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMApplicationsComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Producto' . 'Superficie (m2)' . 'Dosis'}
]

{ #category : #rendering }
FOMApplicationsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Superficie (m2)' . 'Dosis'}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element substance comercialName.
	element surface.
	element dose}
]

{ #category : #callbacks }
FOMApplicationsComponent >> editElement: element [
	(self call: (AplicationEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMApplicationsComponent >> elements [
	^ (self session aplications) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]
