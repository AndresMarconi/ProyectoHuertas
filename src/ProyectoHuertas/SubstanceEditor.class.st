Class {
	#name : #SubstanceEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'comercialNameEditorComponent',
		'activeIngredientsEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
SubstanceEditor >> accept [
	self checkIfCommercialNameIsAlreadyInUse.
	super accept
]

{ #category : #accessing }
SubstanceEditor >> activeIngredients [ 
	^ ActiveIngredient selectAll asSortedCollection: [ :a :b | a tradeName < b tradeName ]
]

{ #category : #private }
SubstanceEditor >> checkIfCommercialNameIsAlreadyInUse [
	(self session gapAFarm
		isSubstanceCommercialNameInUse: comercialNameEditorComponent bufferedValue
		byOtherThan: subject)
		ifTrue: [ comercialNameEditorComponent
				addProblem: 'Ya existe un producto con ese nombre' ]
]

{ #category : #'subclass-responsibility' }
SubstanceEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {comercialNameEditorComponent.
	activeIngredientsEditorComponent} , super children
]

{ #category : #'subclass-responsibility' }
SubstanceEditor >> initializeComponents [
	"Initialize all property components"

	comercialNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #comercialName
		label: 'Nombre Comercial'
		required: true.
	activeIngredientsEditorComponent := MultipleSelectPropertyEditorComponent
		subject: subject
		selector: #activeIngredients
		label: 'Principios activos'
		required: false.
	activeIngredientsEditorComponent
		possibleValues: self activeIngredients.
	super initializeComponents.
]
