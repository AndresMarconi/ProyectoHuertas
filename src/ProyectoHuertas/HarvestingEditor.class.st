Class {
	#name : #HarvestingEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'quantityEditorComponent',
		'varietyEditorComponent',
		'otherUnitEditorComponent',
		'plotEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
HarvestingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		plotEditorComponent.
		quantityEditorComponent.
		otherUnitEditorComponent.
		varietyEditorComponent}, 
		super children
]

{ #category : #'as yet unclassified' }
HarvestingEditor >> defaultProduct [
	^ self session selectedPlot sowings last variety
]

{ #category : #'as yet unclassified' }
HarvestingEditor >> defaultSurface [
	^ (self session selectedPlot) surface
]

{ #category : #'subclass-responsibility' }
HarvestingEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha de Cosecha'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'Lote'
		required: true.
	plotEditorComponent possibleValues: self plots.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Kg cosechados'
		required: true.
	otherUnitEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #otherUnit
		label: 'unidad adicional de medida'
		required: true.
	varietyEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #variety
		label: 'Producto'
		required: true.
	varietyEditorComponent
		possibleValues: {nil} , (self varieties).
	super initializeComponents.
]

{ #category : #accessing }
HarvestingEditor >> plots [
	^ self session plots asOrderedCollection
]

{ #category : #accessing }
HarvestingEditor >> varieties [
	^ (self session cultivars) asOrderedCollection.
]
