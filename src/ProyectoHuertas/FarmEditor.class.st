Class {
	#name : #FarmEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'nameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
FarmEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {nameEditorComponent.
		commentEditorComponent}
]

{ #category : #'subclass-responsibility' }
FarmEditor >> initializeComponents [
	"Initialize all property components"

	nameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #name
		label: 'Nombre de Granja'
		required: true.
	super initializeComponents.
]
