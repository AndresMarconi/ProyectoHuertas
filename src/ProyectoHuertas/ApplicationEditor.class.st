Class {
	#name : #ApplicationEditor,
	#superclass : #EventEditor,
	#instVars : [
		'surfaceEditorComponent',
		'doseEditorComponent',
		'machineEditorComponent',
		'substanceEditorComponent',
		'reasonEditorComponent',
		'notAllowed'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
ApplicationEditor >> accept [
	| substance plot |
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	substance:= substanceEditorComponent bufferedValue.
	plot:= plotEditorComponent bufferedValue.
	((substance allowedUsage) includes: (plot currentCrop))
		ifFalse: [ notAllowed:= true. ^self ]. 
	super accept
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> eventSpecificChildren [

	^ {reasonEditorComponent.
	substanceEditorComponent.
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
		label: 'Razón'
		required: true.
	reasonEditorComponent possibleValues: self possibleReasons.
	doseEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #dose
		label: 'Dosis'
		required: true.
	machineEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #machine
		label: 'Maquina Usada'
		required: true.
	substanceEditorComponent := DropdownSelectPropertyEditorComponent
		subject: subject
		selector: #substance
		label: 'Producto'
		required: true.
	substanceEditorComponent possibleValues: {nil} , self substances.
	substanceEditorComponent instructions: 'Solo podrá registrar aplicaciones de substancias en su inventario.'.
	notAllowed := false.

]

{ #category : #accessing }
ApplicationEditor >> plots [
	^ self session plots asOrderedCollection
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> possibleReasons [
	^ {'Control de peste' . 'Tratamiento de enfermedad'.
	'Prevención' . 'Preparación de suelo' . 'Otro (aclarar en notas)'}
]

{ #category : #rendering }
ApplicationEditor >> renderContentOn: html [
	self renderProblemOn: html.
	super renderContentOn: html.
]

{ #category : #rendering }
ApplicationEditor >> renderProblemOn: html [
	notAllowed ifTrue: [ html alert beDanger; 
		with: 'no puede aplicar ', substanceEditorComponent bufferedValue comercialName,' a ', plotEditorComponent bufferedValue currentCrop vulgarName ]
]

{ #category : #accessing }
ApplicationEditor >> substances [
	^ self session farm inventoryItems
		ifNotEmpty: [ :inventoryItems | inventoryItems collect: #substance ]
		ifEmpty: [ self session substances asOrderedCollection ]
]
