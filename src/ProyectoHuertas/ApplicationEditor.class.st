Class {
	#name : #ApplicationEditor,
	#superclass : #EventEditor,
	#instVars : [
		'surfaceEditorComponent',
		'doseEditorComponent',
		'machineEditorComponent',
		'substanceEditorComponent',
		'reasonEditorComponent',
		'notAllowed',
		'notEnough',
		'quantityEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ApplicationEditor >> eventSpecificChildren [
	^ {reasonEditorComponent.
	substanceEditorComponent.
	quantityEditorComponent.
	doseEditorComponent.
	machineEditorComponent}
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	reasonEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #reason
		label: 'Motivo'
		required: true.
	reasonEditorComponent possibleValues: {nil}, Application reasons.
	quantityEditorComponent := MeasurementPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad utilizada'
		required: true
		units: {'Kg' . 'L'}.
	doseEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #dose
		label: 'Dosificación'
		required: false.
	machineEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #machine
		label: 'Maquina Usada'
		required: false.
	substanceEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #substance
		label: 'Producto'
		required: true.
	substanceEditorComponent possibleValues: {nil} , self substances.
	substanceEditorComponent
		instructions: 'Solo podrá registrar aplicaciones de substancias en su inventario.'.
	notAllowed := false.
	notEnough := false
]

{ #category : #accessing }
ApplicationEditor >> plots [
	^ self session farm plots asOrderedCollection
]

{ #category : #rendering }
ApplicationEditor >> renderProblemsOn: html [
	super renderProblemsOn: html.
	notAllowed ifTrue: [ html alert beDanger; 
		with: 'no puede aplicar ', substanceEditorComponent bufferedValue comercialName,' a ', plotEditorComponent bufferedValue currentCrop vulgarName ].
	notEnough ifTrue: [ html alert beDanger; 
		with: 'no tiene suficiente ', substanceEditorComponent bufferedValue comercialName,' para aplicar']
]

{ #category : #accessing }
ApplicationEditor >> substances [
	^ self session farm inventoryItems
		ifNotEmpty: [ :inventoryItems | inventoryItems collect: #substance ]
		ifEmpty: [ self session gapAFarm substances asOrderedCollection ]
]
