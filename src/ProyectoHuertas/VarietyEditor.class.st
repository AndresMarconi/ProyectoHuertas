Class {
	#name : #VarietyEditor,
	#superclass : #FOMEditor,
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
		taxonomicNameEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
VarietyEditor >> initializeComponents [
	"Initialize all property components"
	
	taxonomicNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #taxonomicName
		label: 'Nombre Taxonómico'
		required: true.
	vulgarNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #vulgarName
		label: 'Nombre Común'
		required: true.
	super initializeComponents.
]
