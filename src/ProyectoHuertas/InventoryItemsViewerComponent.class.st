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
	^ { 'Fuente' . 'Cantidad' . 'vencimiento' }
]

{ #category : #initialization }
InventoryItemsViewerComponent >> columnValuesFor: element [
	^{element source.
	(element quantity asString , ' ' , item unit).
	element expirationDate yyyymmdd}, (super columnValuesFor: element)
]

{ #category : #hooks }
InventoryItemsViewerComponent >> elementClass [
	^InventoryItemRecord
]

{ #category : #hooks }
InventoryItemsViewerComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ InventoryItemRecordEditor
]

{ #category : #initialization }
InventoryItemsViewerComponent >> elements [ 	
	^item records
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
	html heading level5; with: 'Unidad'.
	html paragraph: item unit.
	html heading level5; with: 'Movimientos'.
	super renderContentOn: html
]
