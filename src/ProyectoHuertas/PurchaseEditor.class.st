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
		label: 'Fecha'
		required: true.
	distributorEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #distributor
		label: 'Distribuidor'
		required: true.
	inputEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #inputs
		label: 'Producto'
		required: true.
	inputEditorComponent
		possibleValues: {nil} , (self substances).
]

{ #category : #accessing }
PurchaseEditor >> substances [
	^ (Substance selectAll) asOrderedCollection.
]
