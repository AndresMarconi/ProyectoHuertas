Class {
	#name : #HarvestingEditor,
	#superclass : #EventEditor,
	#instVars : [
		'surfaceEditorComponent',
		'quantityEditorComponent',
		'otherUnitEditorComponent',
		'cultivarEditorComponent',
		'cropEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
HarvestingEditor >> accept [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	self children do: #accept.
	subject crop: subject plot currentCycle latestSowing crop.
	self answer: subject
]

{ #category : #'subclass-responsibility' }
HarvestingEditor >> eventSpecificChildren [
	^ {quantityEditorComponent.
	otherUnitEditorComponent.
	cultivarEditorComponent}
]

{ #category : #initialization }
HarvestingEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	self initializeCultivarEditorComponent.
	self initializeQuantityEditorComponent.
	self initializeOtherUnitEditorComponent.
	self initializePlotEditorComponent.
]

{ #category : #initialization }
HarvestingEditor >> initializeCultivarEditorComponent [
	cultivarEditorComponent := TextLinePropertyEditorComponent
		id: 'cultivarName'
		subject: subject
		selector: #cultivarName
		label: 'Variedad (cultivar)'
		required: false
]

{ #category : #initialization }
HarvestingEditor >> initializeOtherUnitEditorComponent [
	otherUnitEditorComponent := MeasurementPropertyEditorComponent
		id: 'otherUnit'
		subject: subject
		selector: #otherUnit
		label: 'Cantidad (otra unidad)'
		required: false
		units: self units
]

{ #category : #initialization }
HarvestingEditor >> initializePlotEditorComponent [
	super initializePlotEditorComponent.
	plotEditorComponent
		label: 'Lote - Cultivo';
		labelsBlock: [ :each | self labelForPlot: each ]
]

{ #category : #initialization }
HarvestingEditor >> initializeQuantityEditorComponent [
	quantityEditorComponent := NumberPropertyEditorComponent
		id: 'quantity'
		subject: subject
		selector: #quantity
		label: 'Cantidad (Kg)'
		required: true
]

{ #category : #initialization }
HarvestingEditor >> labelForPlot: each [
	| daysLeft |
	each ifNil: [ ^ '' ].
	^ String
		streamContents: [ :stream | 
			stream nextPutAll: each id.
			each currentCycle latestSowing
				ifNotNil: [ :it | 
					stream
						nextPutAll: ' - ';
						nextPutAll: it crop vulgarName ].
			daysLeft := each withdrawalPeriodDaysLeft.
			daysLeft > 0
				ifTrue: [ stream
						nextPutAll: ' (en carencia por ' , daysLeft printString , ' días más)' ] ]
]

{ #category : #accessing }
HarvestingEditor >> plots [
	^ self session farm plots select: [ :each | each currentCrop notNil ]
]

{ #category : #accessing }
HarvestingEditor >> units [
	^ self session farm harvestingUnits
]
