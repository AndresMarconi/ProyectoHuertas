Class {
	#name : #InventoryItemRecordEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'sourceEditorComponent',
		'quantityEditorComponent',
		'expirationDateEditorComponent',
		'unit'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'as yet unclassified' }
InventoryItemRecordEditor class >> subject: aSubject unit: aUnit [
	^ self new
		subject: aSubject;
		unit: aUnit;
		yourself
]

{ #category : #'subclass-responsibility' }
InventoryItemRecordEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {sourceEditorComponent.
		quantityEditorComponent.
		expirationDateEditorComponent}, 
		super children
]

{ #category : #'subclass-responsibility' }
InventoryItemRecordEditor >> initializeComponents [
	"Initialize all property components"
	sourceEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #source
		label: 'Fuente'
		required: true.
	quantityEditorComponent := MeasurementPropertyEditorComponent
		subject: subject
		selector: #quantity
		label: 'Cantidad'
		required: true
		units: { self unit } .
	expirationDateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #expirationDate
		label: 'Vencimiento'
		required: true.
	super initializeComponents.
]

{ #category : #accessing }
InventoryItemRecordEditor >> unit [
	^unit
]

{ #category : #accessing }
InventoryItemRecordEditor >> unit: anObject [
	unit := anObject
]
