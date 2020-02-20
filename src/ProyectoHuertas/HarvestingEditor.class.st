Class {
	#name : #HarvestingEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'quantityEditorComponent',
		'varietyEditorComponent',
		'otherUnitEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
HarvestingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		surfaceEditorComponent.
		quantityEditorComponent.
		otherUnitEditorComponent.
		varietyEditorComponent}
]

{ #category : #'as yet unclassified' }
HarvestingEditor >> defaultProduct [
	^ ((self session selectedPlot) sowings last ) variety
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
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'm2 cosechados'
		required: true.
	surfaceEditorComponent setDefault: (self defaultSurface).
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
		possibleValues: {nil} , (self varieties);
		setDefault: self defaultProduct
]

{ #category : #accessing }
HarvestingEditor >> varieties [
	^ (self session varieties) asOrderedCollection.
]
