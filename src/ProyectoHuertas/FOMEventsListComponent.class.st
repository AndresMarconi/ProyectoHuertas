Class {
	#name : #FOMEventsListComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMEventsListComponent >> saveAddedElement: anEvent [
	super saveAddedElement: anEvent.
	anEvent plot addEvent: anEvent.
	anEvent plot save
]
