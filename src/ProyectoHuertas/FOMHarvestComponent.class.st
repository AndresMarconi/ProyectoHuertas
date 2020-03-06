Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMEventsListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMHarvestComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Cultivo' . 'Variedad (cultivar)' . 'Cantidad (Kg)' . 'Superficie (m2)'}
]

{ #category : #rendering }
FOMHarvestComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element crop vulgarName.
	element cultivarName.
	element surface.
	element quantity}
]

{ #category : #hooks }
FOMHarvestComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Harvesting 
]

{ #category : #hooks }
FOMHarvestComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ HarvestingEditor
]

{ #category : #accessing }
FOMHarvestComponent >> elements [
	^ (self session harvestings) asSortedCollection: [ :a :b | a date > b date ]
]
