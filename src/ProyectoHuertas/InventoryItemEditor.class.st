Class {
	#name : #InventoryItemEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'substanceEditorComponent',
		'unitEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
InventoryItemEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {substanceEditorComponent.
		unitEditorComponent}, 
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
	unitEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #unit
		label: 'Unidad de medida'
		required: true.
	unitEditorComponent 
		possibleValues: {nil} , (self units).
	super initializeComponents.
]

{ #category : #accessing }
InventoryItemEditor >> substances [
	^ self session gapAFarm substances
]

{ #category : #constants }
InventoryItemEditor >> units [ 
	^Substance units
]
