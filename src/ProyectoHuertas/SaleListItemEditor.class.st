Class {
	#name : #SaleListItemEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'items'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #adding }
SaleListItemEditor >> addRow [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	self children do: #accept.
	subject addItem: CropSale new.
	items:= subject items collect: [ :each | SaleItemEditor subject: each ].
	
]

{ #category : #callbacks }
SaleListItemEditor >> cancel [
	parent ifNil: [ self answer: nil ] ifNotNil: [ :it | it answer: nil ]
]

{ #category : #'subclass-responsibility' }
SaleListItemEditor >> children [ 
	^items
]

{ #category : #'subclass-responsibility' }
SaleListItemEditor >> initializeComponents [
	items:= subject items collect: [ :each | SaleItemEditor subject: each ].
	
]

{ #category : #rendering }
SaleListItemEditor >> renderContentOn: html [
	html heading level4; with: 'Fecha: ', (subject date asDate ddmmyyyy).
	html heading level4; with: 'Cliente: ', (subject client).
	html heading level4; with: 'Productos'.
	self renderProblemsOn: html.
	html form: [ 
		self renderElementsTableOn: html.
		html formButton
				bePrimary;
				callback: [ self addRow ];
				with: 'agregar item'.
		html break; break.
		self renderButtonsOn: html]
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
