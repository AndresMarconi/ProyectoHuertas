Class {
	#name : #InventoryItemsViewerComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#instVars : [
		'item'
	],
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #accessing }
InventoryItemsViewerComponent class >> item: item [
	^ self new
		item: item;
		yourself
]

{ #category : #initialization }
InventoryItemsViewerComponent >> columnHeadings [
	^ {'Fecha'.
	'Motivo'.
	('Cantidad (' , item substance unit , ')')} , super columnHeadings
]

{ #category : #initialization }
InventoryItemsViewerComponent >> columnValuesFor: element [
	^ {element date mmddyyyy.
	element reason.
	element quantity greaseString} , (super columnValuesFor: element)
]

{ #category : #callbacks }
InventoryItemsViewerComponent >> editElement: element [
	(self
		call: (self elementEditorClass subject: element unit: item unit))
		ifNotNil: [ :it | self saveEditedElement: it ]
]

{ #category : #hooks }
InventoryItemsViewerComponent >> elementClass [
	^InventoryItemMovement
]

{ #category : #hooks }
InventoryItemsViewerComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ InventoryItemMovementEditor
]

{ #category : #initialization }
InventoryItemsViewerComponent >> elements [ 	
	^item movements
]

{ #category : #initialization }
InventoryItemsViewerComponent >> initialize [
	super initialize.
	duplicateEnabled := false.
	addEnabled:= false.
]

{ #category : #accessing }
InventoryItemsViewerComponent >> item [
	^ item
]

{ #category : #accessing }
InventoryItemsViewerComponent >> item: anObject [
	item := anObject
]

{ #category : #rendering }
InventoryItemsViewerComponent >> renderContentOn: html [
	html heading level5; with: 'Substancia'.
	html paragraph: item substance.
	html heading level5; with: 'Movimientos'.
	super renderContentOn: html
]
