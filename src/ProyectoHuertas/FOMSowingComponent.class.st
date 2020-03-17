Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMEventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMSowingComponent >> columnHeadings [
	^ super columnHeadings , {'Cultivo' . 'Variedad (cultivar)'.
	'Cantidad'}, self generalColumnHeadings
]

{ #category : #rendering }
FOMSowingComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. . }}"

	^ (super columnValuesFor: element)
		,
			{element crop vulgarName.
			element cultivarName.
			(element quantity magnitude asString , ' ' , element quantity unit)}, (self generalColumnValuesFor: element)
]

{ #category : #hooks }
FOMSowingComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Sowing
]

{ #category : #hooks }
FOMSowingComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SowingEditor
]

{ #category : #accessing }
FOMSowingComponent >> elements [
	^ (self session sowings) asSortedCollection: [ :a :b | a date > b date ]
]
