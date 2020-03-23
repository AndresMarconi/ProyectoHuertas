Class {
	#name : #CropEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'yieldEditorComponent',
		'vulgarNameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
CropEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {vulgarNameEditorComponent.
		yieldEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
CropEditor >> initializeComponents [
	"Initialize all property components"
	
	vulgarNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #vulgarName
		label: 'Nombre'
		required: true.
	yieldEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #optimalYieldPerPlant
		label: 'Rinde óptimo (kg/hectárea)'
		required: true.
	super initializeComponents.
]
