Class {
	#name : #HarvestingEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'quantityEditorComponent',
		'otherUnitEditorComponent',
		'plotEditorComponent',
		'cultivarEditorComponent',
		'cropEditorComponent'
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
	cropEditorComponent.
	cultivarEditorComponent} , super children
]

{ #category : #accessing }
HarvestingEditor >> crops [
	^ (self session crops) asOrderedCollection.
]

{ #category : #'as yet unclassified' }
HarvestingEditor >> defaultProduct [
	^ self session selectedPlot sowings last crop
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
	cropEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #crop
		label: 'Cultivo'
		required: true.
	cultivarEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #cultivarName
		label: 'Variedad (cultivar)'
		required: false.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Kg cosechados'
		required: true.
	otherUnitEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #otherUnit
		label: 'Unidad adicional de medida'
		required: false.
	cropEditorComponent possibleValues: {nil} , self crops.
	super initializeComponents
]

{ #category : #accessing }
HarvestingEditor >> plots [
	^ self session plots asOrderedCollection
]
