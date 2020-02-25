Class {
	#name : #SaleItemEditor,
	#superclass : #FOMEditor,
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
		plotEditorComponent.
		commentEditorComponent}
]

{ #category : #'subclass-responsibility' }
SaleItemEditor >> initializeComponents [
	"Initialize all property components"
	productEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #product
		label: 'Producto'
		required: true.
	productEditorComponent
		possibleValues: {nil} , (self varieties).
	kilogramsEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #kilograms
		label: 'kilogramos'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'Lote'
		required: true.
	plotEditorComponent
		possibleValues: {nil} , (self plots).
	super initializeComponents.
]

{ #category : #accessing }
SaleItemEditor >> plots [ 
	^ (self session plots) asOrderedCollection.
]

{ #category : #accessing }
SaleItemEditor >> varieties [
	^ (self session varieties) asOrderedCollection.
]
