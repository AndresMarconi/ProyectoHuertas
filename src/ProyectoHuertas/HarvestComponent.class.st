Class {
	#name : #HarvestComponent,
	#superclass : #EventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
HarvestComponent >> columnHeadings [
	^ super columnHeadings , { 'Cultivo' . 'Variedad (cultivar)' . 'Cantidad'}
]

{ #category : #rendering }
HarvestComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }}"

	^ (super columnValuesFor: element)
		,
			{element crop vulgarName.
			element cultivarName.
			(self quantityStringFor: element)}
]

{ #category : #hooks }
HarvestComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Harvesting 
]

{ #category : #hooks }
HarvestComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ HarvestingEditor
]

{ #category : #accessing }
HarvestComponent >> elements [
	^ (self session farm harvestings) asSortedCollection: [ :a :b | a dateAndTime > b dateAndTime ]
]

{ #category : #rendering }
HarvestComponent >> quantityStringFor: aHarvesing [
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
