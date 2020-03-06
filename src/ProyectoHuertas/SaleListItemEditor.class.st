Class {
	#name : #SaleListItemEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'items'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
SaleListItemEditor >> accept [ 
	items do: #accept.
]

{ #category : #adding }
SaleListItemEditor >> addRow: html [
	items do: #accept.
	subject addItem: SaleItem new.
	
]

{ #category : #'subclass-responsibility' }
SaleListItemEditor >> initializeComponents [
	items:= OrderedCollection new.
	subject items do: [ :each | items add: (SaleItemEditor subject: each) ]
	
]

{ #category : #rendering }
SaleListItemEditor >> renderContentOn: html [
	html form: [ 
		self renderElementsTableOn: html.
		html formButton
				bePrimary;
				callback: [ self addRow: html ];
				with: 'agregar item' ]
]

{ #category : #rendering }
SaleListItemEditor >> renderElementsTableOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ {'producto'. 'kilos'. 'lote'}
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ items
						do: [ :element | 
							html
								tableRow: [ html render: element ] ] ]. ]
]
