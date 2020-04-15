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

{ #category : #'subclass-responsibility' }
HarvestingEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	cropEditorComponent := DropdownSelectPropertyEditorComponent
	   id: 'cropSelector'
		subject: subject
		selector: #crop
		label: 'Cultivo'
		required: true.
	cropEditorComponent possibleValuesBlock: [ self crops ].
	cultivarEditorComponent := TextLinePropertyEditorComponent
		id: 'cultivarName'
		subject: subject
		selector: #cultivarName
		label: 'Variedad (cultivar)'
		required: false.
	quantityEditorComponent := NumberPropertyEditorComponent
		id: 'quantity'
		subject: subject
		selector: #quantity
		label: 'Cantidad (Kg)'
		required: true.
	otherUnitEditorComponent := MeasurementPropertyEditorComponent
	   id: 'otherUnit'
		subject: subject
		selector: #otherUnit
		label: 'Cantidad (otra unidad)'
		required: false
		units: self units.
	plotEditorComponent dependentWidget: cropEditorComponent
]

{ #category : #accessing }
HarvestingEditor >> plots [
	^ self session farm plots asOrderedCollection
]

{ #category : #accessing }
HarvestingEditor >> units [
	^ self session farm harvestingUnits
]
