Class {
	#name : #ProblemEditor,
	#superclass : #FOMEditor,
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
		nameEditorComponent.
		commentEditorComponent}
]

{ #category : #'subclass-responsibility' }
ProblemEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha del Problema'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'Superficie afectada (m2)'
		required: true.
	nameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #name
		label: 'Problema'
		required: true.
	super initializeComponents.
]
