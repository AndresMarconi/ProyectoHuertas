Class {
	#name : #SaleItemEditor,
	#superclass : #GAFEditor,
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

{ #category : #accessing }
SaleItemEditor >> crops [
	^ self session gapAFarm crops
]

{ #category : #accessing }
SaleItemEditor >> hasProblems [
	(self children flatCollect: #problems) ifEmpty: [ ^false ] ifNotEmpty: [ ^true ]
]

{ #category : #'subclass-responsibility' }
SaleItemEditor >> initializeComponents [
	"Initialize all property components"

	productEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #crop
		label: 'Producto'
		required: true.
	productEditorComponent possibleValues: { nil }, self crops.
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
]

{ #category : #accessing }
SaleItemEditor >> plots [ 
	^ (self session farm plots) asOrderedCollection.
]

{ #category : #accessing }
SaleItemEditor >> problems [ 
	^self children flatCollect: #problems
]

{ #category : #rendering }
SaleItemEditor >> renderContentOn: html [
	self children do: [ :each | html tableData: [each renderInputOn: html] ]
	
]
