Class {
	#name : #InventoryItemMovementEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'quantityEditorComponent',
		'unit',
		'dateEditorComponent',
		'reasonEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'instance creation' }
InventoryItemMovementEditor class >> subject: aSubject [
	self error: 'Use #subject:unit: instead'
]

{ #category : #'instance creation' }
InventoryItemMovementEditor class >> subject: anInventoryRecord unit: aString [
	^ self new
		unit: aString;
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
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	reasonEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #reason
		label: 'Motivo'
		required: true.
	reasonEditorComponent
		instructions:
			'Indique el motivo de este movimiento (p.e., compra, aplicaciones, desecho, etc.)'.
	quantityEditorComponent := NumberPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad (' , (unit ifNil: [ 'Unidades' ]) , ')'
		required: true.
	quantityEditorComponent
		instructions: 'Utilice números negativos para indicar egresos.'.
	super initializeComponents
]

{ #category : #accessing }
InventoryItemMovementEditor >> unit: anObject [
	unit := anObject
]
