Class {
	#name : #ApplicationEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'doseEditorComponent',
		'machineEditorComponent',
		'substanceEditorComponent',
		'plotEditorComponent',
		'reasonEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ApplicationEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
	plotEditorComponent.
	reasonEditorComponent.
	substanceEditorComponent.
	doseEditorComponent.
	machineEditorComponent} , super children
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
	reasonEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #reason
		label: 'Razón'
		required: true.
	reasonEditorComponent possibleValues: self possibleReasons.
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
	substanceEditorComponent possibleValues: {nil} , self substances.
	super initializeComponents
]

{ #category : #accessing }
ApplicationEditor >> plots [
	^ self session plots asOrderedCollection
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> possibleReasons [
	^ {'Control de peste' . 'Tratamiento de enfermedad'.
	'Prevención' . 'Preparación de suelo' . 'Otro (aclarar en notas)'}
]

{ #category : #accessing }
ApplicationEditor >> substances [
	^ (self session substances) asOrderedCollection.
]
