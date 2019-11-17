"
This is a simple editor to edit the info of a person.

To try this component as a standalone application evaluate: 
   
  | app |
  app := WAAdmin register: ExampleOfPluggableEditor  asApplicationAt: 'example-editor'.
  app 	addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary. 
"
Class {
	#name : #ExampleOfPluggableEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'fullNameEditorComponent',
		'birthDateEditorComponent',
		'deathDateEditorComponent',
		'weightEditorComponent',
		'cvEditorComponent',
		'favoriteClassSelectorEditor'
	],
	#category : #'ProyectoHuertas-widgets-examples'
}

{ #category : #'subclass-responsibility' }
ExampleOfPluggableEditor >> children [
	"Return all property editors in this editor"

	^ {fullNameEditorComponent.
	birthDateEditorComponent.
	weightEditorComponent.
	favoriteClassSelectorEditor.
	cvEditorComponent}
]

{ #category : #initialization }
ExampleOfPluggableEditor >> initialize [
	subject := ExampleObjectToEdit new.
	super initialize
]

{ #category : #initialization }
ExampleOfPluggableEditor >> initializeComponents [
	"Initialize all property components"

	fullNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #fullName
		label: 'Nombre completo'
		required: true.
	weightEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #weight
		label: 'Peso'
		required: true.
	birthDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #birthDate
		label: 'Fecha de nacimiento'
		required: true.
	favoriteClassSelectorEditor := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #favoriteClass
		label: 'Clase favorita'
		required: true.
	favoriteClassSelectorEditor
		possibleValues: {nil} , SequenceableCollection subclasses.
	cvEditorComponent := TextAreaPropertyEditorComponent
		subject: subject
		selector: #cv
		label: 'Curriculum Vitae Resumido'
		required: false
]
