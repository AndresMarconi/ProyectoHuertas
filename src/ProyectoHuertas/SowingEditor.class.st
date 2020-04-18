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
		id: 'cropSelector'
		subject: subject
		selector: #crop
		label: 'Cultivo'
		required: true.
	cropEditorComponent possibleValuesBlock: [ self crops ].
	cultivarEditorComponent := TextLinePropertyEditorComponent
		id: 'cultivar'
		subject: subject
		selector: #cultivarName
		label: 'Variedad (cultivar)'
		required: false.
	quantityEditorComponent := MeasurementPropertyEditorComponent
		id: 'quantity'
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true
		units: {'Plantas' . 'Kg de semilla'}.
	timeToHarvestEditorComponent := NumberPropertyEditorComponent
		id: 'timeToHarvest'
		subject: subject
		selector: #timeToHarvest
		label: 'Tiempo estimado para cosechar (en días)'
		required: true.
	harvestDurationEditorComponent := NumberPropertyEditorComponent
		id: 'harvestDuration'
		subject: subject
		selector: #harvestDuration
		label: 'Duración estimada de la cosecha (en días)'
		required: true.
	expectedYieldEditorComponent := NumberPropertyEditorComponent
		id: 'expectedYield'
		subject: subject
		selector: #expectedYield
		label: 'Rendimiento total esperado (en Kg)'
		required: true
]

{ #category : #accessing }
SowingEditor >> plots [
	^ self session farm plots asOrderedCollection
]

{ #category : #'subclass-responsibility' }
SowingEditor >> renderChildrenOn: html [
	{dateEditorComponent.
	timeEditorComponent.
	plotEditorComponent.
	cropEditorComponent} do: [ :each | html render: each ].
	html render: commentEditorComponent.
	html alert
		beInfo;
		with:
			'La información que se solicita a continuación se utiliza para afrecerle mejores consejos. Si no la tiene, simplemente complete con 0 (cero)'.
	{quantityEditorComponent.
	timeToHarvestEditorComponent.
	harvestDurationEditorComponent.
	expectedYieldEditorComponent} do: [ :each | html render: each ]
]
