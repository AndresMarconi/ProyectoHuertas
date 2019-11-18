Class {
	#name : #PurchaseEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'distributorEditorComponent',
		'inputEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
PurchaseEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		distributorEditorComponent.
		inputEditorComponent}
]

{ #category : #'subclass-responsibility' }
PurchaseEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'fecha'
		required: true.
	distributorEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #distributor
		label: 'Distribuidor'
		required: true.
	inputEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #inputs
		label: 'producto'
		required: true
]
