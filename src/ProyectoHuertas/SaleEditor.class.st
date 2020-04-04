Class {
	#name : #SaleEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'dateEditorComponent',
		'clientEditorComponent',
		'listComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SaleEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
	clientEditorComponent.
	listComponent} , super children
]

{ #category : #'subclass-responsibility' }
SaleEditor >> initializeComponents [
	"Initialize all property components"
	
	super initializeComponents.
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	clientEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #client
		label: 'Cliente'
		required: true.
	listComponent:= SaleListItemEditor subject: subject.
]
