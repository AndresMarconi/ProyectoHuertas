Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMEventsListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMSowingComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Cultivo' . 'Variedad (cultivar)'.
	'Cantidad'}
]

{ #category : #rendering }
FOMSowingComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. . }}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element crop vulgarName.
	element cultivarName.
	(element quantity magnitude asString , ' ' , element quantity unit)}
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
