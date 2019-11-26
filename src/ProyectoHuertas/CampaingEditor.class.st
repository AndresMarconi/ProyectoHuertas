Class {
	#name : #CampaingEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'startDateEditorComponent',
		'endDateEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
CampaingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {startDateEditorComponent.
		endDateEditorComponent}
]

{ #category : #'subclass-responsibility' }
CampaingEditor >> initializeComponents [
	"Initialize all property components"

	startDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #startDate
		label: 'Fecha de Inicio'
		required: true.
	endDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #endDate
		label: 'Fecha Fin'
		required: true
]
