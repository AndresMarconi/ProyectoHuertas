Class {
	#name : #SowingComponent,
	#superclass : #EventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
SowingComponent >> columnHeadings [
	^ super columnHeadings , {'Cultivo' . 'Variedad (cultivar)'.
	'Cantidad'}
]

{ #category : #rendering }
SowingComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. . }}"

	^ (super columnValuesFor: element)
		,
			{element crop vulgarName.
			element cultivarName.
			(element quantity magnitude asString , ' ' , element quantity unit)}
]

{ #category : #hooks }
SowingComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Sowing
]

{ #category : #hooks }
SowingComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SowingEditor
]

{ #category : #accessing }
SowingComponent >> elements [
	^ (self session farm sowings) asSortedCollection: [ :a :b | a dateAndTime > b dateAndTime ]
]
