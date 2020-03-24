Class {
	#name : #SalesComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #callbacks }
SalesComponent >> addElement [
	^ (self
		call: (self elementEditorClass subject: self elementClass new))
		ifNotNil: [ :it | 
			(self call: (SaleListItemEditor subject: it))
				ifNotNil: [ :sale | self saveAddedElement: sale ] ]
]

{ #category : #rendering }
SalesComponent >> columnHeadings [
	^ { 'Fecha'. 'Cliente'. }, super columnHeadings
]

{ #category : #rendering }
SalesComponent >> columnValuesFor: element [
	^ {element date asDate ddmmyyyy.
	element client},(super columnValuesFor: element)
]

{ #category : #callbacks }
SalesComponent >> editElement: element [
	(self call: (self elementEditorClass subject: element))
		ifNotNil: [ :it | self call: (SaleListItemEditor subject: it). self saveEditedElement: it ]
]

{ #category : #hooks }
SalesComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Sale
]

{ #category : #hooks }
SalesComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SaleEditor 
]

{ #category : #callbacks }
SalesComponent >> elements [
	^ (self session farm sales) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #adding }
SalesComponent >> saveAddedElement: aSale [
	super saveAddedElement: aSale.
	self session farm addSale: aSale.
	aSale items
		do: [ :aCropSale | 
			aCropSale
				date: aSale date;
				time: Time now.
			(aCropSale plot)
				addEvent: aCropSale;
				save ].
	self session farm save
]
