Class {
	#name : #PlotEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'idEditorComponent',
		'surfaceEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
PlotEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {idEditorComponent.
		surfaceEditorComponent}
]

{ #category : #'subclass-responsibility' }
PlotEditor >> initializeComponents [
	"Initialize all property components"

	idEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #id
		label: 'Numero de lote'
		required: true.
	idEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'Superficie del lote (m2)'
		required: true
]
