Class {
	#name : #InventoryComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #adding }
InventoryComponent >> addRecord: substance [
	| record |
	record := self
		call:
			(InventoryItemRecordEditor
				subject: InventoryItemRecord new).
	record ifNotNil: [ :it | substance addRecord: it ].
	substance save
]

{ #category : #rendering }
InventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Principio Activo' . 'Unidad de medida'  }, super columnHeadings
]

{ #category : #rendering }
InventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance activeIngredients.
	element unit}
		, (super columnValuesFor: element)
]

{ #category : #hooks }
InventoryComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ InventoryItem 
]

{ #category : #hooks }
InventoryComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ InventoryItemEditor
]

{ #category : #accessing }
InventoryComponent >> elements [
	^ self session farm inventoryItems
]

{ #category : #initialization }
InventoryComponent >> initialize [
	super initialize.
	duplicateEnabled := false.
	viewEnabled:= true
]

{ #category : #rendering }
InventoryComponent >> renderSpecificActionsFor: element on: html [
	html anchor
		class: 'dropdown-item';
		callback: [ self addRecord: element ];
		with: 'Registrar movimiento'
]

{ #category : #adding }
InventoryComponent >> saveAddedElement: anInventoryItem [
	self session farm inventoryItems
		detect: [ :each | each substance = anInventoryItem substance ]
		ifFound: [ :it | self session farm updateStockOf: it with: anInventoryItem ]
		ifNone: [ super saveAddedElement: anInventoryItem.
			self session farm addInventoryItem: anInventoryItem ].
	self session farm save
]

{ #category : #callbacks }
InventoryComponent >> viewElement: element [
	^self call: (InventoryItemsViewerComponent item: element)
]
