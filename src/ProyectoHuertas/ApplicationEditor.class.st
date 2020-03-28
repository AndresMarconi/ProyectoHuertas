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
		'notEnough'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
ApplicationEditor >> accept [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	 (self checkWithdrawalPeriodRecomendation and: [ self checkItemQuantity ])
	ifFalse: [ ^self ].
	super accept
]

{ #category : #'as yet unclassified' }
ApplicationEditor >> checkItemQuantity [
	| item |
	item:= self session farm inventoryItems detect: 
		[ :each | each substance = substanceEditorComponent bufferedValue].
	item quantity >= doseEditorComponent bufferedValue
		ifTrue: [ ^true ]
		ifFalse: [ notEnough:= true. ^false ]
]

{ #category : #'as yet unclassified' }
ApplicationEditor >> checkWithdrawalPeriodRecomendation [
	| substance plot |
	substance:= substanceEditorComponent bufferedValue.
	plot:= plotEditorComponent bufferedValue.
	((substance allowedUsage) includes: (plot currentCrop))
		ifFalse: [ notAllowed:= true. ^false ]
		ifTrue: [ ^true ]
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
	doseEditorComponent := NumberPropertyEditorComponent 
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
	notEnough:= false.

]

{ #category : #accessing }
ApplicationEditor >> plots [
	^ self session farm plots asOrderedCollection
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
