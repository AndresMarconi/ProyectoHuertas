Class {
	#name : #ProblemEditor,
	#superclass : #EventEditor,
	#instVars : [
		'nameEditorComponent',
		'problemTypeEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ProblemEditor >> allowedProblemTypes [
	^ {'Peste' . 'Enfermedad' . 'Falta de nutrientes' . 'Otro'}
]

{ #category : #'subclass-responsibility' }
ProblemEditor >> eventSpecificChildren [
	^ {problemTypeEditorComponent.
	nameEditorComponent}
]

{ #category : #'subclass-responsibility' }
ProblemEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
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

]

{ #category : #accessing }
ProblemEditor >> plots [
	^ self session plots asOrderedCollection
]
