Class {
	#name : #SowingEditor,
	#superclass : #EventEditor,
	#instVars : [
		'quantityEditorComponent',
		'timeToHarvestEditorComponent',
		'harvestDurationEditorComponent',
		'expectedYieldEditorComponent',
		'cropEditorComponent',
		'cultivarEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #accessing }
SowingEditor >> crops [
	^ (self session farm mostFrequentelyPlanted: 10) , {nil}
		, self session gapAFarm crops
]

{ #category : #'subclass-responsibility' }
SowingEditor >> eventSpecificChildren [
	^ {cropEditorComponent.
	cultivarEditorComponent.
	quantityEditorComponent.
	timeToHarvestEditorComponent.
	harvestDurationEditorComponent.
	expectedYieldEditorComponent}
]

{ #category : #'subclass-responsibility' }
SowingEditor >> frequentlyPlantedCrops [
	^ self session farm frequentlyPlantedCrops
]

{ #category : #'subclass-responsibility' }
SowingEditor >> initializeComponents [
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
	quantityEditorComponent := MeasurementPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true
		units: {'Plantas' . 'Kg de semilla'}.
	timeToHarvestEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #timeToHarvest
		label: 'Tiempo estimado para cosechar (en días)'
		required: true.
	harvestDurationEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #harvestDuration
		label: 'Duración estimada de la cosecha (en días)'
		required: true.
	expectedYieldEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #expectedYield
		label: 'Rendimiento total esperado (en Kg)'
		required: true
]

{ #category : #accessing }
SowingEditor >> plots [
	^ self session farm plots asOrderedCollection
]
