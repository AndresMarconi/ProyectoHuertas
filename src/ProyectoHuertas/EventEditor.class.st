Class {
	#name : #EventEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'dateEditorComponent',
		'plotEditorComponent',
		'timeEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
EventEditor >> children [
	^ {dateEditorComponent.
	timeEditorComponent.
	plotEditorComponent} , self eventSpecificChildren, super children
]

{ #category : #'subclass-responsibility' }
EventEditor >> eventSpecificChildren [
	^ self subclassResponsibility
]

{ #category : #'subclass-responsibility' }
EventEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	dateEditorComponent := DatePropertyEditorComponent
	   id: 'date'
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	timeEditorComponent := TimeStringPropertyEditorComponent
	   id: 'time'
		subject: subject
		selector: #time
		label: 'Hora'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
	   id: 'plotSelector'
		subject: subject
		selector: #plot
		label: 'Lote'
		required: true.
	plotEditorComponent
		possibleValuesBlock: [ {nil} , self plots ];
		labelsBlock: [ :each | each ifNil: [  ] ifNotNil: [ each id ] ]
]
