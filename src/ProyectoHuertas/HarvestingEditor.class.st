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
	^ (self session farm mostFrequentelyHarvested: 10) , {nil}
		, self session gapAFarm crops
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
		subject: subject
		selector: #crop
		label: 'Cultivo'
		required: true.
	cropEditorComponent possibleValues: self crops.
	cultivarEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #cultivarName
		label: 'Variedad (cultivar)'
		required: false.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad (Kg)'
		required: true.
	otherUnitEditorComponent := MeasurementPropertyEditorComponent
		subject: subject
		selector: #otherUnit
		label: 'Cantidad (otra unidad)'
		required: false
		units: self units
]

{ #category : #accessing }
HarvestingEditor >> plots [
	^ self session farm plots asOrderedCollection
]

{ #category : #accessing }
HarvestingEditor >> units [
	^ self session farm harvestingUnits
]
