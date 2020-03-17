Class {
	#name : #FOMApplicationsComponent,
	#superclass : #FOMEventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMApplicationsComponent >> columnHeadings [
	^ super columnHeadings , {'Razón'. 'Producto' . 'Dosis'}, self generalColumnHeadings
]

{ #category : #rendering }
FOMApplicationsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}"

	^ (super columnValuesFor: element)
		,
			{element reason.
			element substance comercialName.
			element dose}, (self generalColumnValuesFor: element)
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
