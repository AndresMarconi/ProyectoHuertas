Class {
	#name : #HarvestingEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'quantityEditorComponent',
		'varietyEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
HarvestingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		surfaceEditorComponent.
		quantityEditorComponent.
		varietyEditorComponent}
]

{ #category : #'subclass-responsibility' }
HarvestingEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'fecha de Aplicacion'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'm2 de aplicacion'
		required: true.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'cantidad'
		required: true.
	varietyEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #variety
		label: 'Producto'
		required: true.
	varietyEditorComponent
		possibleValues: {nil} , (self varieties).
]

{ #category : #accessing }
HarvestingEditor >> varieties [
	^ (Variety selectAll) asOrderedCollection.
]
