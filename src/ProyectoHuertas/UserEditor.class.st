Class {
	#name : #UserEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'userNameEditorComponent',
		'firstNameEditorComponent',
		'lastaNameEditorComponent',
		'passwordEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
UserEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {userNameEditorComponent.
		firstNameEditorComponent.
		lastaNameEditorComponent.
		passwordEditorComponent}
]

{ #category : #'subclass-responsibility' }
UserEditor >> initializeComponents [
	"Initialize all property components"

	userNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #username
		label: 'Nombre de Usuario'
		required: true.
	firstNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #firstName
		label: 'Nombre'
		required: true.
	lastaNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #lastName
		label: 'Apellido'
		required: true.
	passwordEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #password
		label: 'Contaseña'
		required: true
]
