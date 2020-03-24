Class {
	#name : #InventoryItemEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'substanceEditorComponent',
		'quantityEditorComponent',
		'expirationDateEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
InventoryItemEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {substanceEditorComponent.
		expirationDateEditorComponent.
		quantityEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
InventoryItemEditor >> initializeComponents [
	"Initialize all property components"
	substanceEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #substance
		label: 'Substancia'
		required: true.
	substanceEditorComponent
		possibleValues: {nil} , (self substances).
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true.
	expirationDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #expirationDate
		label: 'Fecha de Vencimiento'
		required: true.
	super initializeComponents.
]

{ #category : #accessing }
InventoryItemEditor >> substances [
	^ (self session substances) asOrderedCollection.
]
