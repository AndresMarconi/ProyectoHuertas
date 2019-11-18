Class {
	#name : #SowingEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'varietyEditorComponent',
		'distributionEditorComponent',
		'quantityEditorComponent',
		'conductionSystemEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SowingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		surfaceEditorComponent.
		varietyEditorComponent.
		quantityEditorComponent.
		distributionEditorComponent.
		conductionSystemEditorComponent}
]

{ #category : #'subclass-responsibility' }
SowingEditor >> initializeComponents [
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
]
