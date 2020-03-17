Class {
	#name : #FOMEventsTableComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMEventsTableComponent >> columnHeadings [
	^ {'Fecha' . 'Lote'}
]

{ #category : #rendering }
FOMEventsTableComponent >> columnValuesFor: element [
	^ {(element date ddmmyyyy , ' - ' , element time print24WithoutSeconds ).
	element plot id}
]

{ #category : #'as yet unclassified' }
FOMEventsTableComponent >> generalColumnHeadings [
	^super columnHeadings
]

{ #category : #'as yet unclassified' }
FOMEventsTableComponent >> generalColumnValuesFor: element [
	^super columnValuesFor: element
]

{ #category : #adding }
FOMEventsTableComponent >> saveAddedElement: anEvent [
	super saveAddedElement: anEvent.
	anEvent plot addEvent: anEvent.
	anEvent plot save
]
