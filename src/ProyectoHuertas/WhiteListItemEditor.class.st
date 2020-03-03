Class {
	#name : #WhiteListItemEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'aptitudEditorComponent',
		'wasteEditorComponent',
		'activeIngredientsEditorComponent',
		'waitingPeriodAfterApplicationEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #accessing }
WhiteListItemEditor >> activeIngredients [ 
	^ ActiveIngredient selectAll asSortedCollection: [ :a :b | a ingredient < b ingredient ]
]

{ #category : #'subclass-responsibility' }
WhiteListItemEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {
		activeIngredientsEditorComponent.
		waitingPeriodAfterApplicationEditorComponent.
		aptitudEditorComponent.
		wasteEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
WhiteListItemEditor >> initializeComponents [
	"Initialize all property components"

	activeIngredientsEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #activeIngredient
		label: 'Principio activo'
		required: true.
	activeIngredientsEditorComponent
		possibleValues: {nil} , (self activeIngredients);
		setDefault: subject activeIngredient.
	aptitudEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #aptitud
		label: 'Aptitud'
		required: true.
	wasteEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #waste
		label: 'Residuo'
		required: true.
	waitingPeriodAfterApplicationEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #waitingPeriod
		label: 'Tiempo de carencia (en días)'
		required: true.
	super initializeComponents.
]
