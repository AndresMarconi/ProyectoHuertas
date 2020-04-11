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

{ #category : #callbacks }
InventoryItemsViewerComponent >> addElement [
	| record |
	record := self
		call:
			(InventoryItemMovementEditor
				subject: InventoryItemMovement new
				substance: item substance).
	record
		ifNotNil: [ :it | 
			item addMovement: it.
			item save ]
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
		call:
			(InventoryItemMovementEditor
				subject: element
				substance: item substance))
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
	addEnabled:= true.
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
	| activeIngredienteNames |
	activeIngredienteNames := item substance activeIngredients
		collect: #tradeName.
	html paragraph: [ html strong: 'Substancia' ].
	html paragraph: item substance.
	html
		row: [ html
				column: [ html paragraph: [ html strong: 'Aptitud' ].
					html
						paragraph:
							(SenasaCatalogue singleton
								combinedApplicabilitiesFor: activeIngredienteNames)
								asCommaString ]
					mediumSize: 6;
				column: [ html paragraph: [ html strong: 'Principios activos' ].
					html paragraph: activeIngredienteNames asCommaString ]
					mediumSize: 6 ].
	html paragraph: [ html strong: 'Movimientos' ].
	super renderContentOn: html
]
