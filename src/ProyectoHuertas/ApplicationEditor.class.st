Class {
	#name : #ApplicationEditor,
	#superclass : #EventEditor,
	#instVars : [
		'surfaceEditorComponent',
		'doseEditorComponent',
		'machineEditorComponent',
		'substanceEditorComponent',
		'quantityEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ApplicationEditor >> eventSpecificChildren [
	^ {substanceEditorComponent.
	quantityEditorComponent.
	doseEditorComponent.
	machineEditorComponent}
]

{ #category : #initialization }
ApplicationEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	self initializeQuantityEditorComponent.
	self initializeDoseEditorComponent.
	self initializeMachineEditorComponent.
	self initializeSubstanceEditorComponent.

]

{ #category : #initialization }
ApplicationEditor >> initializeDoseEditorComponent [
	doseEditorComponent := NumberPropertyEditorComponent
		id: 'dose'
		subject: subject
		selector: #dose
		label: 'Dosificación'
		required: false
]

{ #category : #initialization }
ApplicationEditor >> initializeMachineEditorComponent [
	machineEditorComponent := TextLinePropertyEditorComponent
		id: 'machine'
		subject: subject
		selector: #machine
		label: 'Maquina Usada'
		required: false
]

{ #category : #initialization }
ApplicationEditor >> initializeQuantityEditorComponent [
	quantityEditorComponent := NumberPropertyEditorComponent
		id: 'quantity'
		subject: subject
		selector: #quantity
		label: 'Cantidad utilizada (por lote)'
		required: true
]

{ #category : #initialization }
ApplicationEditor >> initializeSubstanceEditorComponent [
	substanceEditorComponent := DropdownSelectPropertyEditorComponent
		id: 'productSelector'
		subject: subject
		getBlock: [ :app | self inventoryItemFor: app substance ]
		setBlock: [ :app :item | app substance: item substance ]
		label: 'Producto'
		required: true.
	substanceEditorComponent
		possibleValuesBlock: [ {nil} , self inventoryItems ];
		labelsBlock: [ :each | 
			each
				ifNil: [ '' ]
				ifNotNil: [ each substance comercialName , ' (en existencia: '
						, each balance asString , ' ' , each substance unit , ')' ] ];
		instructions: 'Solo podrá registrar aplicaciones de substancias en su inventario.'
]

{ #category : #'subclass-responsibility' }
ApplicationEditor >> inventoryItemFor: aSubstance [
	^ self inventoryItems
		detect: [ :each | each substance = aSubstance ]
		ifNone: [ nil ]
]

{ #category : #accessing }
ApplicationEditor >> inventoryItems [
	^ self session farm inventoryItems
]

{ #category : #accessing }
ApplicationEditor >> plots [
	^ self session farm plots asOrderedCollection
]

{ #category : #rendering }
ApplicationEditor >> renderProblemsOn: html [
	super renderProblemsOn: html.

]

{ #category : #accessing }
ApplicationEditor >> substances [
	^ self session farm inventoryItems
		ifNotEmpty: [ :inventoryItems | inventoryItems collect: #substance ]
		ifEmpty: [ Array new ]
]
