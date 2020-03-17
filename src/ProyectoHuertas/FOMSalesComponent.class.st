Class {
	#name : #FOMSalesComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #callbacks }
FOMSalesComponent >> addElement [
	(self call: (self elementEditorClass subject: self elementClass new))
		ifNotNil: [ :it | 
			(self call: (SaleListItemEditor subject: it))
			ifNotNil: [ :sale | 
				self saveAddedElement: sale ] ]
]

{ #category : #rendering }
FOMSalesComponent >> columnHeadings [
	^ { 'Fecha'. 'Cliente'. }, super columnHeadings
]

{ #category : #rendering }
FOMSalesComponent >> columnValuesFor: element [
	^ {element date asDate ddmmyyyy.
	element client},(super columnValuesFor: element)
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
