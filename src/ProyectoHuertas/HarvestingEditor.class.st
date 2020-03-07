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
	^ (self session crops) asOrderedCollection.
]

{ #category : #accessing }
HarvestingEditor >> defaultProduct [
	^ self session selectedPlot sowings last crop
]

{ #category : #accessing }
HarvestingEditor >> defaultSurface [
	^ (self session selectedPlot) surface
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
		units: self units.
	cropEditorComponent possibleValues: {nil} , self crops.

]

{ #category : #accessing }
HarvestingEditor >> plots [
	^ self session plots asOrderedCollection
]

{ #category : #accessing }
HarvestingEditor >> units [
	^ self session farm harvestingUnits
]
