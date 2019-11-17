Class {
	#name : #SubstanceEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'comercialNameEditorComponent',
		'brandEditorComponent',
		'activeIngredientsEditorComponent',
		'waitingPeriodAfterApplicationEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SubstanceEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {comercialNameEditorComponent.
	brandEditorComponent.
	activeIngredientsEditorComponent.
	waitingPeriodAfterApplicationEditorComponent}
]

{ #category : #'subclass-responsibility' }
SubstanceEditor >> initializeComponents [
	"Initialize all property components"

	comercialNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #comercialName
		label: 'Nombre comercial'
		required: true.
	brandEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #brand
		label: 'Marca'
		required: false.
	activeIngredientsEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #activeIngredients
		label: 'Componentes activos'
		required: false.
	waitingPeriodAfterApplicationEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #waitingPeriodAfterApplication
		label: 'Tiempo de carencia (en días)'
		required: true
]
