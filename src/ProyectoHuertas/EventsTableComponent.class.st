Class {
	#name : #EventsTableComponent,
	#superclass : #GAFAbstractTableWithFilterAndActionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
EventsTableComponent >> columnHeadings [
	^ {'Fecha' . 'Lote'}
]

{ #category : #rendering }
EventsTableComponent >> columnValuesFor: element [
	^ {(element date ddmmyyyy , ' - ' , element time print24WithoutSeconds ).
	element plot id}
]

{ #category : #'as yet unclassified' }
EventsTableComponent >> generalColumnHeadings [
	^super columnHeadings
]

{ #category : #'as yet unclassified' }
EventsTableComponent >> generalColumnValuesFor: element [
	^super columnValuesFor: element
]

{ #category : #adding }
EventsTableComponent >> saveAddedElement: anEvent [
	super saveAddedElement: anEvent.
	anEvent plot addEvent: anEvent.
	anEvent plot save
]
