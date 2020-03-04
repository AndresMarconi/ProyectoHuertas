Class {
	#name : #FOMSaleItemsListComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #actions }
FOMSaleItemsListComponent >> accept [
	^ self
]

{ #category : #accessing }
FOMSaleItemsListComponent >> addElement [
	(self call: (self elementEditorClass subject: self elementClass new))
		ifNotNil: [ :it | self parent subject addItem: it ]
]

{ #category : #rendering }
FOMSaleItemsListComponent >> columnHeadings [
	^ {'Producto' . 'Origen' . 'Cantidad (Kg)'}
]

{ #category : #rendering }
FOMSaleItemsListComponent >> columnValuesFor: element [
	^ {element product.
	element plot.
	element kilograms}
]

{ #category : #hooks }
FOMSaleItemsListComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ SaleItem 
]

{ #category : #hooks }
FOMSaleItemsListComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SaleItemEditor 
]

{ #category : #accessing }
FOMSaleItemsListComponent >> elements [
	^ self parent
		ifNil: [ Array new ]
		ifNotNil: [ :it | it subject items ]
]

{ #category : #actions }
FOMSaleItemsListComponent >> hasProblems [
	^ false
]

{ #category : #accessing }
FOMSaleItemsListComponent >> parent: aComponent [
	super parent: aComponent.
	paginator := Paginator newTotalElements: self elements perPage: 10
]

{ #category : #accessing }
FOMSaleItemsListComponent >> problems [
	^ Array new
]

{ #category : #accessing }
FOMSaleItemsListComponent >> removeElement: element [
	self parent subject removeItem: element
]
