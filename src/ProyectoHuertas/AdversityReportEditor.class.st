Class {
	#name : #AdversityReportEditor,
	#superclass : #EventEditor,
	#instVars : [
		'descriptionEditorComponent',
		'typesEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
AdversityReportEditor >> allowedProblemTypes [
	^ AdversityReport types
]

{ #category : #'subclass-responsibility' }
AdversityReportEditor >> eventSpecificChildren [
	^ {typesEditorComponent.
	descriptionEditorComponent}
]

{ #category : #'subclass-responsibility' }
AdversityReportEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	descriptionEditorComponent := TextLinePropertyEditorComponent
		id: 'descriptionOfAdversities'
		subject: subject
		selector: #descriptionOfAdversities
		label: 'Detalle'
		required: true.
	descriptionEditorComponent
		instructions: 'por ejemplo: Mosca blanca y Arañuela roja'.
	typesEditorComponent := MultipleSelectPropertyEditorComponent
		id: #adversityTypes
		subject: subject
		selector: #adversityTypes
		label: 'Tipificación'
		required: true.
	typesEditorComponent
		instructions: 'mantenga oprimido Ctrl para seleccionar varios';
		possibleValuesBlock: [ self allowedProblemTypes ];
		rows: self allowedProblemTypes size
]

{ #category : #accessing }
AdversityReportEditor >> plots [
	^ self session farm plots asOrderedCollection
]
