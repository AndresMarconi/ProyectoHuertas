Class {
	#name : #FOMEventsListComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMEventsListComponent >> columnHeadings [
	^ {'Fecha' . 'Lote'}
]

{ #category : #rendering }
FOMEventsListComponent >> columnValuesFor: element [
	^ {(element date asDate ddmmyyyy , ' - ' , element time).
	element plot id}
]

{ #category : #adding }
FOMEventsListComponent >> saveAddedElement: anEvent [
	super saveAddedElement: anEvent.
	anEvent plot addEvent: anEvent.
	anEvent plot save
]
