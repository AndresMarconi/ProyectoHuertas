Class {
	#name : #ApplicationsComponent,
	#superclass : #EventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
ApplicationsComponent >> columnHeadings [
	^ super columnHeadings , {'Razón'. 'Producto' . 'Dosis'}, self generalColumnHeadings
]

{ #category : #rendering }
ApplicationsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}"

	^ (super columnValuesFor: element)
		,
			{element reason.
			element substance comercialName.
			element dose}, (self generalColumnValuesFor: element)
]

{ #category : #hooks }
ApplicationsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Application
]

{ #category : #hooks }
ApplicationsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ ApplicationEditor
]

{ #category : #hooks }
ApplicationsComponent >> elements [
	^ (self session farm aplications) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
ApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]
