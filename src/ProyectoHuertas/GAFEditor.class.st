Class {
	#name : #GAFEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'commentEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'subclass-responsibility' }
GAFEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {commentEditorComponent}
]

{ #category : #'subclass-responsibility' }
GAFEditor >> initializeComponents [
	commentEditorComponent := TextAreaPropertyEditorComponent 
		subject: subject
		selector: #comment
		label: 'Notas'
		required: false.
]
