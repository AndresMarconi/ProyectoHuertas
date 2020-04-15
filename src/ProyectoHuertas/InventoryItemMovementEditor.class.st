Class {
	#name : #InventoryItemMovementEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'quantityEditorComponent',
		'dateEditorComponent',
		'reasonEditorComponent',
		'substance'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'instance creation' }
InventoryItemMovementEditor class >> subject: aSubject [
	self error: 'Use #subject:substance: instead'
]

{ #category : #'instance creation' }
InventoryItemMovementEditor class >> subject: anInventoryRecord substance: aSubstance [
	^ self new
		substance: aSubstance;
		subject: anInventoryRecord;
		yourself
]

{ #category : #'subclass-responsibility' }
InventoryItemMovementEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent. reasonEditorComponent.
		quantityEditorComponent.
		}, 
		super children
]

{ #category : #'subclass-responsibility' }
InventoryItemMovementEditor >> initializeComponents [
	"Initialize all property components"

	dateEditorComponent := DatePropertyEditorComponent
	   id: 'date'
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	reasonEditorComponent := TextLinePropertyEditorComponent
	   id: 'reason'
		subject: subject
		selector: #reason
		label: 'Motivo'
		required: true.
	reasonEditorComponent
		instructions:
			'Indique el motivo de este movimiento (p.e., compra, aplicaciones, desecho, etc.)'.
	quantityEditorComponent := NumberPropertyEditorComponent
	   id: 'quantity'
		subject: subject
		selector: #quantity
		label: 'Cantidad (' , substance unit , ')'
		required: true.
	quantityEditorComponent
		instructions: 'Utilice números negativos para indicar egresos.'.
	super initializeComponents
]

{ #category : #accessing }
InventoryItemMovementEditor >> substance: anObject [
	substance := anObject
]
