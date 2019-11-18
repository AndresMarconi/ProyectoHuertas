Class {
	#name : #SaleEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'clientEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SaleEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		clientEditorComponent}
]

{ #category : #'subclass-responsibility' }
SaleEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	clientEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #client
		label: 'Cliente'
		required: true
]
