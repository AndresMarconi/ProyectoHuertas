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

{ #category : #hooks }
EventsTableComponent >> duplicate: anEvent [
	^ (super duplicate: anEvent)
		plot: nil;
		dateAndTime: nil;
		yourself
]

{ #category : #private }
EventsTableComponent >> generalColumnHeadings [
	^super columnHeadings
]

{ #category : #private }
EventsTableComponent >> generalColumnValuesFor: element [
	^super columnValuesFor: element
]

{ #category : #adding }
EventsTableComponent >> saveAddedElement: anEvent [
	super saveAddedElement: anEvent.
	anEvent plot addEvent: anEvent.
	anEvent plot save
]
