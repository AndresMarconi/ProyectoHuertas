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

{ #category : #accessing }
HarvestingEditor >> crops [

	^ {nil}
		,
			(self cropsActiveInSelectedPlot
				ifEmpty: [ self session gapAFarm crops ])
]

{ #category : #accessing }
HarvestingEditor >> cropsActiveInSelectedPlot [
	| selectedPlot |
	selectedPlot := plotEditorComponent bufferedValue.
	selectedPlot ifNil: [ ^ OrderedCollection new ].
	^ (selectedPlot currentCycle sowings collect: #crop) asSet
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #'subclass-responsibility' }
HarvestingEditor >> eventSpecificChildren [
	^ {quantityEditorComponent.
	otherUnitEditorComponent.
	cropEditorComponent.
	cultivarEditorComponent}
]

{ #category : #initialization }
HarvestingEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	self initializeCropEditorComponent.
	self initializeCultivarEditorComponent.
	self initializeQuantityEditorComponent.
	self initializeOtherUnitEditorComponent.
	self initializePlotEditorComponent
]

{ #category : #initialization }
HarvestingEditor >> initializeCropEditorComponent [
	cropEditorComponent := DropdownSelectPropertyEditorComponent
		id: 'cropSelector'
		subject: subject
		selector: #crop
		label: 'Cultivo'
		required: true.
	cropEditorComponent possibleValuesBlock: [ self crops ]
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
		labelsBlock: [ :each |  
			self labelForPlot: each ].
	plotEditorComponent dependentWidget: cropEditorComponent
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
	| daysLeft note |
	each ifNil: [ ^ '' ].
	daysLeft := each waitingPeriodDaysLeft.
	note := daysLeft > 0
		ifTrue: [ ' (en carencia por ' , daysLeft printString , ' días más)' ]
		ifFalse: [ '' ].
	^ each id, note
]

{ #category : #accessing }
HarvestingEditor >> units [
	^ self session farm harvestingUnits
]
