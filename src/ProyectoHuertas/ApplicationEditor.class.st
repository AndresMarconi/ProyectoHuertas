Class {
	#name : #ApplicationEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'doseEditorComponent',
		'machineEditorComponent',
		'substanceEditorComponent',
		'plotEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ApplicationEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		plotEditorComponent.
		doseEditorComponent.
		machineEditorComponent.
		substanceEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> initializeComponents [
	"Initialize all property components"
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha de Aplicacion'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'Lote'
		required: true.
	plotEditorComponent possibleValues: self plots.
	doseEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #dose
		label: 'Dosis'
		required: true.
	machineEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #machine
		label: 'Maquina Usada'
		required: true.
	substanceEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #substance
		label: 'Producto'
		required: true.
	substanceEditorComponent
		possibleValues: {nil} , (self substances).
	super initializeComponents.
]

{ #category : #accessing }
ApplicationEditor >> plots [
	^ self session plots asOrderedCollection
]

{ #category : #accessing }
ApplicationEditor >> substances [
	^ (self session substances) asOrderedCollection.
]
