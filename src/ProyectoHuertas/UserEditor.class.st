Class {
	#name : #UserEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'userNameEditorComponent',
		'firstNameEditorComponent',
		'lastNameEditorComponent',
		'passwordEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
UserEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {userNameEditorComponent.
		firstNameEditorComponent.
		lastNameEditorComponent.
		passwordEditorComponent}
]

{ #category : #'subclass-responsibility' }
UserEditor >> initializeComponents [
	"Initialize all property components"

	userNameEditorComponent := TextLinePropertyEditorComponent
		id: 'username'
		subject: subject
		selector: #username
		label: 'Nombre de Usuario'
		required: true.
	firstNameEditorComponent := TextLinePropertyEditorComponent
		id: 'firstName'
		subject: subject
		selector: #firstName
		label: 'Nombre'
		required: true.
	lastNameEditorComponent := TextLinePropertyEditorComponent
		id: 'lastName'
		subject: subject
		selector: #lastName
		label: 'Apellido'
		required: true.
	passwordEditorComponent := TextLinePropertyEditorComponent
		id: 'password'
		subject: subject
		selector: #password
		label: 'Contaseña'
		required: true
]
