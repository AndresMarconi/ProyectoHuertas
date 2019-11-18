Class {
	#name : #SaleItemEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'productEditorComponent',
		'kilogramsEditorComponent',
		'plotEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SaleItemEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {productEditorComponent.
		kilogramsEditorComponent.
		plotEditorComponent}
]

{ #category : #'subclass-responsibility' }
SaleItemEditor >> initializeComponents [
	"Initialize all property components"
	
	productEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #product
		label: 'Producto'
		required: true.
	kilogramsEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #kilograms
		label: 'kilogramos'
		required: true.
	plotEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'lote'
		required: true
]
