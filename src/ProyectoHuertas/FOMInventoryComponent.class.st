Class {
	#name : #FOMInventoryComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMInventoryComponent >> addElement [
	| substanceStock |
	substanceStock := self
		call: (self elementEditorClass subject: self elementClass new).
	substanceStock
		ifNotNil: [ :it | 
			it save.
			self session farm addInventoryItem: it. 
			self session farm save ]
]

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
