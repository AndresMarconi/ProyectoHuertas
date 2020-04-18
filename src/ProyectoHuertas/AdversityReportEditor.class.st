Class {
	#name : #AdversityReportEditor,
	#superclass : #EventEditor,
	#instVars : [
		'descriptionEditorComponent',
		'typesEditorComponent',
		'selectedPlots'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
AdversityReportEditor >> accept [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	self children do: #accept.
	self
		answer:
			(selectedPlots
				collect: [ :each | 
					subject copy
						plot: each;
						yourself ])
]

{ #category : #'subclass-responsibility' }
AdversityReportEditor >> allowedProblemTypes [
	^ AdversityReport types
]

{ #category : #'subclass-responsibility' }
AdversityReportEditor >> eventSpecificChildren [
	^ {typesEditorComponent.
	descriptionEditorComponent}
]

{ #category : #initialization }
AdversityReportEditor >> initializeComponents [

	super initializeComponents.
	self initializeDescriptionEditorComponent.
	self initializeTypesEditorComponent.

]

{ #category : #initialization }
AdversityReportEditor >> initializeDescriptionEditorComponent [
	descriptionEditorComponent := TextLinePropertyEditorComponent
		id: 'descriptionOfAdversities'
		subject: subject
		selector: #descriptionOfAdversities
		label: 'Detalle'
		required: true.
	descriptionEditorComponent
		instructions: 'por ejemplo: Mosca blanca y Arañuela roja'
]

{ #category : #initialization }
AdversityReportEditor >> initializePlotEditorComponent [
	plotEditorComponent := MultipleSelectPropertyEditorComponent
		id: 'plotSelector'
		subject: self
		selector: #selectedPlots
		label: 'Lotes afectados'
		required: true.
	plotEditorComponent
		rows: (10 min: self plots size);
		possibleValuesBlock: [ self plots ];
		labelsBlock: [ :each | each ifNil: [  ] ifNotNil: [ each id ] ];
		instructions: 'mantenga oprimido Ctrl para seleccionar varios'.
	subject plot ifNotNil: [ plotEditorComponent readOnly: true ]
]

{ #category : #initialization }
AdversityReportEditor >> initializeTypesEditorComponent [
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

{ #category : #accessing }
AdversityReportEditor >> selectedPlots [
	^ selectedPlots
]

{ #category : #accessing }
AdversityReportEditor >> selectedPlots: anObject [
	selectedPlots := anObject
]

{ #category : #initialization }
AdversityReportEditor >> subject: anAdversityReport [
	selectedPlots := {anAdversityReport plot}.
	super subject: anAdversityReport
]
