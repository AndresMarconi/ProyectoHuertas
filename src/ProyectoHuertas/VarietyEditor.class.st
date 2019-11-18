Class {
	#name : #VarietyEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'taxonomicNameEditorComponent',
		'vulgarNameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
VarietyEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {vulgarNameEditorComponent.
		taxonomicNameEditorComponent}
]

{ #category : #'subclass-responsibility' }
VarietyEditor >> initializeComponents [
	"Initialize all property components"
	
	taxonomicNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #taxonomicName
		label: 'nombre taxonomico'
		required: true.
	vulgarNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #vulgarName
		label: 'Nombre comun'
		required: true.
]
