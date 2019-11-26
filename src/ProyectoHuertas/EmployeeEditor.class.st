Class {
	#name : #EmployeeEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'firstNameEditorComponent',
		'lastNameEditorComponent',
		'salaryEditorComponent',
		'notesEditorComponent',
		'startDateEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
EmployeeEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {salaryEditorComponent.
		firstNameEditorComponent.
		lastNameEditorComponent.
		notesEditorComponent.
		startDateEditorComponent}
]

{ #category : #'subclass-responsibility' }
EmployeeEditor >> initializeComponents [
	"Initialize all property components"

	firstNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #firstName
		label: 'Nombre'
		required: true.
	lastNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #lastName
		label: 'Apellido'
		required: true.
	salaryEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #salary
		label: 'Salario'
		required: true.
	startDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #startDate
		label: 'Fecha de Inicio'
		required: true.
	notesEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #notes
		label: 'Notas'
		required: true
]
