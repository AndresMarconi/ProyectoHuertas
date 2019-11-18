Class {
	#name : #FarmEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'nameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
FarmEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {nameEditorComponent}
]

{ #category : #'subclass-responsibility' }
FarmEditor >> initializeComponents [
	"Initialize all property components"

	nameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #name
		label: 'Nombre de Granja'
		required: true
]
