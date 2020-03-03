Class {
	#name : #FOMEventsListComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMEventsListComponent >> addElement [
	| editedEvent |
	editedEvent := self
		call: (self elementEditorClass subject: self elementClass new).
	editedEvent
		ifNotNil: [ :it | 
			it save.
			it plot addEvent: it.
			it plot save ]
]
