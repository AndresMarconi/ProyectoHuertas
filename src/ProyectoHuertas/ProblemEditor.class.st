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
	^ Problem types
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
	nameEditorComponent instructions: 'por ejemplo, Mosca blanca'.
	problemTypeEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #type
		label: 'Tipo de problema'
		required: true.
	problemTypeEditorComponent
		possibleValuesBlock: [ self allowedProblemTypes ]
]

{ #category : #accessing }
ProblemEditor >> plots [
	^ self session farm plots asOrderedCollection
]
