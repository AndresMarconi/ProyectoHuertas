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
		plotEditorComponent}, 
		super children
]

{ #category : #accessing }
SaleItemEditor >> crops [
	^ self session crops
]

{ #category : #'subclass-responsibility' }
SaleItemEditor >> initializeComponents [
	"Initialize all property components"

	productEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #product
		label: 'Producto'
		required: true.
	productEditorComponent possibleValues: self crops.
	kilogramsEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #kilograms
		label: 'Cantidad (Kg)'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'Lote de origen'
		required: true.
	plotEditorComponent possibleValues: {nil} , self plots.
	super initializeComponents
]

{ #category : #accessing }
SaleItemEditor >> plots [ 
	^ (self session plots) asOrderedCollection.
]

{ #category : #accessing }
SaleItemEditor >> varieties [
	^ (self session varieties) asOrderedCollection.
]
