Class {
	#name : #PlotEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'idPEditorComponent',
		'surfaceEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
PlotEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {idPEditorComponent.
		surfaceEditorComponent}
]

{ #category : #'subclass-responsibility' }
PlotEditor >> initializeComponents [
	"Initialize all property components"

	idPEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #id
		label: 'Numero de lote'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'Superficie del Lote (m2)'
		required: true
]
