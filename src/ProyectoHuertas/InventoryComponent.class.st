Class {
	#name : #InventoryComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #callbacks }
InventoryComponent >> addMovement: anInventoryItem [
	| record |
	record := self
		call: 
			(InventoryItemMovementEditor
				subject: InventoryItemMovement new 
				substance: anInventoryItem substance).
	record ifNotNil: [ :it | anInventoryItem addMovement: it ].
	anInventoryItem save 
]

{ #category : #callbacks }
InventoryComponent >> addRecord: anInventoryItem [
	| record |
	record := self
		call:
			(InventoryItemMovementEditor
				subject: InventoryItemMovement new
				unit: anInventoryItem unit).
	record ifNotNil: [ :it | anInventoryItem addMovement: it ].
	anInventoryItem save 
]

{ #category : #rendering }
InventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Principio Activo' . 'Unidad de medida'  }, super columnHeadings
]

{ #category : #rendering }
InventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance activeIngredients.
	element substance unit} , (super columnValuesFor: element)
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
	editEnabled := false.
	viewEnabled := true
]

{ #category : #rendering }
InventoryComponent >> renderSpecificActionsFor: element on: html [
	html div class: 'dropdown-divider'.
	html anchor
		class: 'dropdown-item';
		callback: [ self addMovement: element ];
		with: 'Registrar movimiento'
]

{ #category : #callbacks }
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
