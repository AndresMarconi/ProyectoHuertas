Class {
	#name : #FOMApplicationsComponent,
	#superclass : #FOMEventsListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMApplicationsComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}
]

{ #category : #rendering }
FOMApplicationsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element substance comercialName.
	element dose}
]

{ #category : #hooks }
FOMApplicationsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Application
]

{ #category : #hooks }
FOMApplicationsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ ApplicationEditor
]

{ #category : #callbacks }
FOMApplicationsComponent >> elements [
	^ (self session aplications) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]
