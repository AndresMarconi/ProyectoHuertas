Class {
	#name : #PlotEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'idPEditorComponent',
		'surfaceEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
PlotEditor >> accept [
	self checkIfPlotIdIsAlreadyInUse.
	super accept
]

{ #category : #'as yet unclassified' }
PlotEditor >> checkIfPlotIdIsAlreadyInUse [
	(self session farm
		isPlotIdInUse: idPEditorComponent bufferedValue
		byOtherThan: subject)
		ifTrue: [ idPEditorComponent
				addProblem: 'Ya existe un lote con ese identificador' ]
]

{ #category : #'subclass-responsibility' }
PlotEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {idPEditorComponent.
		surfaceEditorComponent}, 
		super children
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
