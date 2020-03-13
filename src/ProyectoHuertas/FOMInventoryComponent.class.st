Class {
	#name : #FOMInventoryComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #adding }
FOMInventoryComponent >> addSubstanceStock [
	| substanceStock |
	substanceStock := self call: (InventoryItemEditor subject: InventoryItem new).
	substanceStock ifNotNil: [ :it | 
		it save.
		self session farm addInventory: it.
		self session farm save.
		self initializeLists ]
]

{ #category : #rendering }
FOMInventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Principio Activo' . 'Cantidad disponible'}
]

{ #category : #rendering }
FOMInventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance activeIngredients.
	element quantity}
]

{ #category : #hooks }
FOMInventoryComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ InventoryItem 
]

{ #category : #hooks }
FOMInventoryComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ InventoryItemEditor
]

{ #category : #accessing }
FOMInventoryComponent >> elements [
	^ self session inventoryItems
]

{ #category : #initialization }
FOMInventoryComponent >> initialize [
	super initialize.
	duplicateEnabled := false
]

{ #category : #adding }
FOMInventoryComponent >> saveAddedElement: anInventoryItem [
	super saveAddedElement: anInventoryItem.
	self session farm addInventoryItem: anInventoryItem.
	self session farm save
]
