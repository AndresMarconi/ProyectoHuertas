Class {
	#name : #InventoryComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #adding }
InventoryComponent >> addSubstanceStock [
	| substanceStock |
	substanceStock := self call: (InventoryItemEditor subject: InventoryItem new).
	substanceStock ifNotNil: [ :it | 
		it save.
		self session farm addInventory: it.
		self session farm save.
		self initializeLists ]
]

{ #category : #rendering }
InventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Principio Activo' . 'Cantidad disponible'}, super columnHeadings
]

{ #category : #rendering }
InventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance activeIngredients.
	element quantity}, (super columnValuesFor: element)
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
	^ self session inventoryItems
]

{ #category : #initialization }
InventoryComponent >> initialize [
	super initialize.
	duplicateEnabled := false
]

{ #category : #adding }
InventoryComponent >> saveAddedElement: anInventoryItem [
	super saveAddedElement: anInventoryItem.
	self session farm addInventoryItem: anInventoryItem.
	self session farm save
]
