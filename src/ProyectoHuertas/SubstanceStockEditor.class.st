Class {
	#name : #SubstanceStockEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'substanceEditorComponent',
		'quantityEditorComponent',
		'expirationDateEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SubstanceStockEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {substanceEditorComponent.
		expirationDateEditorComponent.
		quantityEditorComponent}
]

{ #category : #'subclass-responsibility' }
SubstanceStockEditor >> initializeComponents [
	"Initialize all property components"
	
	substanceEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #substance
		label: 'substancia'
		required: true.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true.
	expirationDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #expirationDate
		label: 'Fecha de vencimiento'
		required: true
]
