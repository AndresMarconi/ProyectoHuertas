Class {
	#name : #ApplicationsComponent,
	#superclass : #EventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
ApplicationsComponent >> columnHeadings [
	^ super columnHeadings , {'Producto' . 'Cantidad'}, self generalColumnHeadings
]

{ #category : #rendering }
ApplicationsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}"

	^ (super columnValuesFor: element)
		,
			{element substance comercialName.
			(element quantity printString , ' ' , element substance unit)}
		, (self generalColumnValuesFor: element)
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
	^ (self session farm aplications) asSortedCollection: [ :a :b | a dateAndTime > b dateAndTime ]
]

{ #category : #printing }
ApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]
