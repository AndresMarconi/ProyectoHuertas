Class {
	#name : #ProblemEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'nameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ProblemEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		surfaceEditorComponent.
		nameEditorComponent}
]

{ #category : #'subclass-responsibility' }
ProblemEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'fecha de Aplicacion'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'm2 de aplicacion'
		required: true.
	nameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #name
		label: 'problema'
		required: true
]
