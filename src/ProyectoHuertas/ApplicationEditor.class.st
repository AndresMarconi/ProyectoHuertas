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
	   id: 'reason'
		subject: subject
		selector: #reason
		label: 'Motivo'
		required: true.
	reasonEditorComponent
		possibleValuesBlock: [ {nil} , Application reasons ].
	quantityEditorComponent := NumberPropertyEditorComponent
	   id: 'quantity'
		subject: subject
		selector: #quantity
		label: 'Cantidad utilizada'
		required: true.
	doseEditorComponent := NumberPropertyEditorComponent
	   id: 'dose'
		subject: subject
		selector: #dose
		label: 'Dosificación'
		required: false.
	machineEditorComponent := TextLinePropertyEditorComponent
	   id: 'machine'
		subject: subject
		selector: #machine
		label: 'Maquina Usada'
		required: false.
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
		instructions: 'Solo podrá registrar aplicaciones de substancias en su inventario.'.
	notAllowed := false.
	notEnough := false
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
	notAllowed ifTrue: [ html alert beDanger; 
		with: 'no puede aplicar ', substanceEditorComponent bufferedValue comercialName,' a ', plotEditorComponent bufferedValue currentCrop vulgarName ].
	notEnough ifTrue: [ html alert beDanger; 
		with: 'no tiene suficiente ', substanceEditorComponent bufferedValue comercialName,' para aplicar']
]

{ #category : #accessing }
ApplicationEditor >> substances [
	^ self session farm inventoryItems
		ifNotEmpty: [ :inventoryItems | inventoryItems collect: #substance ]
		ifEmpty: [ Array new ]
]
