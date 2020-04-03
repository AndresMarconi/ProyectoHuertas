Class {
	#name : #InventoryItemRecordEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'sourceEditorComponent',
		'quantityEditorComponent',
		'expirationDateEditorComponent',
		'unit'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
InventoryItemRecordEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {sourceEditorComponent.
		quantityEditorComponent.
		expirationDateEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
InventoryItemRecordEditor >> initializeComponents [
	"Initialize all property components"
	sourceEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #source
		label: 'Fuente'
		required: true.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true.
	expirationDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #expirationDate
		label: 'Vencimiento'
		required: true.
	super initializeComponents.
]
