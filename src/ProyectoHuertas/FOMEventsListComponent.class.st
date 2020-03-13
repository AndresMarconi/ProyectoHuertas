Class {
	#name : #FOMEventsListComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMEventsListComponent >> columnHeadings [
	^ {'Fecha' . 'Lote'}
]

{ #category : #rendering }
FOMEventsListComponent >> columnValuesFor: element [
	^ {(element date ddmmyyyy , ' - ' , element time print24WithoutSeconds ).
	element plot id}
]

{ #category : #adding }
FOMEventsListComponent >> saveAddedElement: anEvent [
	super saveAddedElement: anEvent.
	anEvent plot addEvent: anEvent.
	anEvent plot save
]
