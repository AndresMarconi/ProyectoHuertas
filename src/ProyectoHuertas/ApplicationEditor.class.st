Class {
	#name : #ApplicationEditor,
	#superclass : #EventEditor,
	#instVars : [
		'surfaceEditorComponent',
		'doseEditorComponent',
		'machineEditorComponent',
		'substanceEditorComponent',
		'reasonEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ApplicationEditor >> eventSpecificChildren [

	^ {reasonEditorComponent.
	substanceEditorComponent.
	doseEditorComponent.
	machineEditorComponent}
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
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
