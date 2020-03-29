Class {
	#name : #InventoryComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

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
	^ self session farm inventoryItems
]

{ #category : #initialization }
InventoryComponent >> initialize [
	super initialize.
	duplicateEnabled := false
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
