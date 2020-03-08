Class {
	#name : #FOMSalesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMSalesComponent >> addElement [
	(self call: (self elementEditorClass subject: self elementClass new))
		ifNotNil: [ :it | self call: (SaleListItemEditor subject: it). self saveAddedElement: it ]
]

{ #category : #rendering }
FOMSalesComponent >> columnHeadings [
	^ { 'Fecha'. 'Cliente'. }
]

{ #category : #rendering }
FOMSalesComponent >> columnValuesFor: element [
	^ {element date asDate ddmmyyyy.
	element client}
]

{ #category : #callbacks }
FOMSalesComponent >> editElement: element [
	(self call: (self elementEditorClass subject: element))
		ifNotNil: [ :it | self call: (SaleListItemEditor subject: it). self saveEditedElement: it ]
]

{ #category : #hooks }
FOMSalesComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Sale
]

{ #category : #hooks }
FOMSalesComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SaleEditor 
]

{ #category : #callbacks }
FOMSalesComponent >> elements [
	^ (self session sales) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #adding }
FOMSalesComponent >> saveAddedElement: aSale [
	super saveAddedElement: aSale.
	self session farm addSale: aSale.
	self session farm save
]
