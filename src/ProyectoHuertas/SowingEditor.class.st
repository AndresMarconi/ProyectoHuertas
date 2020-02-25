Class {
	#name : #SowingEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'surfaceEditorComponent',
		'varietyEditorComponent',
		'distributionEditorComponent',
		'quantityEditorComponent',
		'conductionSystemEditorComponent',
		'timeToHarvestEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SowingEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		surfaceEditorComponent.
		varietyEditorComponent.
		quantityEditorComponent.
		distributionEditorComponent.
		conductionSystemEditorComponent.
		timeToHarvestEditorComponent}, 
		super children 
]

{ #category : #'subclass-responsibility' }
SowingEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha de Siembra'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #surface
		label: 'm2 Sembrados'
		required: true.
	varietyEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #variety
		label: 'Producto'
		required: true.
	varietyEditorComponent
		possibleValues: {nil} , (self varieties).
	conductionSystemEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #conductionSystem
		label: 'Sistema de Conduccion'
		required: true.
	distributionEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #distribution
		label: 'Distribucion'
		required: true.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true.
	timeToHarvestEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #timeToHarvest
		label: 'Tiempo estimado para cosechar(en dias)'
		required: true.
	super initializeComponents.
]

{ #category : #accessing }
SowingEditor >> varieties [
	^ (self session cultivars) asOrderedCollection
]
