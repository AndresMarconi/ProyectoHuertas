Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMEventsListComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMHarvestComponent >> columnHeadings [
	^ super columnHeadings , { 'Cultivo' . 'Variedad (cultivar)' . 'Cantidad'}
]

{ #category : #rendering }
FOMHarvestComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }}"

	^ (super columnValuesFor: element)
		,
			{element crop vulgarName.
			element cultivarName.
			(self quantityStringFor: element)}
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

{ #category : #rendering }
FOMHarvestComponent >> quantityStringFor: aHarvesing [
	| stream |
	stream := String new writeStream.
	stream
		nextPutAll: aHarvesing quantity printString;
		nextPutAll: ' Kg'.
	aHarvesing otherUnit
		ifNotNil: [ :it | 
			stream
				nextPutAll: ' / ';
				nextPutAll: it printString ].
	^ stream contents
]
