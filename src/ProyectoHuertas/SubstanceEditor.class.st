Class {
	#name : #SubstanceEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'comercialNameEditorComponent',
		'activeIngredientsEditorComponent',
		'typeEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #accessing }
SubstanceEditor >> activeIngredients [ 
	^ ActiveIngredient selectAll asSortedCollection: [ :a :b | a ingredient < b ingredient ]
]

{ #category : #'subclass-responsibility' }
SubstanceEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {comercialNameEditorComponent.
		activeIngredientsEditorComponent.
		typeEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
SubstanceEditor >> initializeComponents [
	"Initialize all property components"

	comercialNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #comercialName
		label: 'Nombre Comercial'
		required: true.
	activeIngredientsEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #activeIngredients
		label: 'Principios activos'
		required: true.
	activeIngredientsEditorComponent
		possibleValues: {nil} , (self activeIngredients).
	typeEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #usage
		label: 'Uso'
		required: true.
	typeEditorComponent possibleValues: { 'Fertilizante'. 'Pesticida' }.
	super initializeComponents.
]
