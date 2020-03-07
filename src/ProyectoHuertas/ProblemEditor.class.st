Class {
	#name : #ProblemEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'nameEditorComponent',
		'plotEditorComponent',
		'problemTypeEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ProblemEditor >> allowedProblemTypes [
	^ {'Peste' . 'Enfermedad' . 'Otro'}
]

{ #category : #'subclass-responsibility' }
ProblemEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
	plotEditorComponent.
	problemTypeEditorComponent.
	nameEditorComponent} , super children
]

{ #category : #'subclass-responsibility' }
ProblemEditor >> initializeComponents [
	"Initialize all property components"

	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha del Problema'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'Lote'
		required: true.
	plotEditorComponent possibleValues: self plots.
	nameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #name
		label: 'Problema'
		required: true.
	problemTypeEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #type
		label: 'Tipo de problema'
		required: true.
	problemTypeEditorComponent possibleValues: self allowedProblemTypes.
	super initializeComponents
]

{ #category : #accessing }
ProblemEditor >> plots [
	^ self session plots asOrderedCollection
]
