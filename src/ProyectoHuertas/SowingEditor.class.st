Class {
	#name : #SowingEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'quantityEditorComponent',
		'timeToHarvestEditorComponent',
		'harvestDurationEditorComponent',
		'expectedYieldEditorComponent',
		'plotEditorComponent',
		'cropEditorComponent',
		'cultivarEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SowingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
	plotEditorComponent.
	cropEditorComponent.
	cultivarEditorComponent.
	quantityEditorComponent.
	timeToHarvestEditorComponent.
	harvestDurationEditorComponent.
	expectedYieldEditorComponent} , super children
]

{ #category : #accessing }
SowingEditor >> crops [
	^ (self session crops) asOrderedCollection
]

{ #category : #'subclass-responsibility' }
SowingEditor >> initializeComponents [
	"Initialize all property components"

	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha de Siembra'
		required: true.
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #plot
		label: 'Lote'
		required: true.
	plotEditorComponent possibleValues: self plots.
	cropEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #crop
		label: 'Cultivo'
		required: true.
	cropEditorComponent possibleValues: {nil} , self crops.
	cultivarEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #cultivarName
		label: 'Variedad (cultivar)'
		required: false.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: false.
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
		required: true.
	super initializeComponents
]

{ #category : #accessing }
SowingEditor >> plots [
	^ self session plots asOrderedCollection
]
