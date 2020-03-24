Class {
	#name : #CropEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'yieldEditorComponent',
		'vulgarNameEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
CropEditor >> allowedCropNames [
	^ {nil} , SenasaCatalog singleton cropVulgarNames
		copyWithoutAll: (self session crops collect: #vulgarName)
]

{ #category : #'subclass-responsibility' }
CropEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {vulgarNameEditorComponent.
		yieldEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
CropEditor >> initializeComponents [
	"Initialize all property components"

	vulgarNameEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #vulgarName
		label: 'Nombre'
		required: true.
	vulgarNameEditorComponent
		possibleValues: self allowedCropNames;
		instructions:
			'Solo se admiten cultivos para los que existan principios activos registrados en SENASA'.
	yieldEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #optimalYieldPerPlant
		label: 'Rinde óptimo (kg/hectárea)'
		required: true.
	super initializeComponents
]

{ #category : #rendering }
CropEditor >> renderContentOn: html [
	subject vulgarName
		ifNotNil: [ vulgarNameEditorComponent readOnly: true ].
	super renderContentOn: html
]
