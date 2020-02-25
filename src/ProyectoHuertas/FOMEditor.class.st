Class {
	#name : #FOMEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'commentEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
FOMEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {commentEditorComponent}
]

{ #category : #'subclass-responsibility' }
FOMEditor >> initializeComponents [
	commentEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #comment
		label: 'comentario'
		required: false.
]
