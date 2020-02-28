Class {
	#name : #CultivarEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'yieldEditorComponent',
		'vulgarNameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
CultivarEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {vulgarNameEditorComponent.
		yieldEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
CultivarEditor >> initializeComponents [
	"Initialize all property components"
	
	vulgarNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #vulgarName
		label: 'Nombre'
		required: true.
	yieldEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #yield
		label: 'Rinde'
		required: true.
	super initializeComponents.
]
