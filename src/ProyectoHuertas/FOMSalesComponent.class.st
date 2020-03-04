Class {
	#name : #FOMSalesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMSalesComponent >> addElement [
	| sale |
	sale := self
		call: (self elementEditorClass subject: self elementClass new).
	sale
		ifNotNil: [ :it | 
			it save.
			self session farm addSale: it.
			self session farm save ]
]

{ #category : #adding }
FOMSalesComponent >> addSale [
	| sale |
	sale := self call: (SaleEditor subject: Sale new).
	sale ifNotNil: [ :it | 
		it save. 
		self session user addSale: it.
		self session user save ]
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
	| sale |
	sale := self call: (SaleEditor subject: element).
	sale ifNotNil: [ :it | it save ]
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
