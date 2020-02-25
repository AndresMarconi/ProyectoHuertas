Class {
	#name : #PlotEditor,
	#superclass : #FOMEditor,
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
		surfaceEditorComponent.
		commentEditorComponent}
]

{ #category : #'subclass-responsibility' }
PlotEditor >> initializeComponents [
	"Initialize all property components"

	idPEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #id
		label: 'Identificador del lote'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'Superficie del Lote (m2)'
		required: true.
	super initializeComponents.
]
