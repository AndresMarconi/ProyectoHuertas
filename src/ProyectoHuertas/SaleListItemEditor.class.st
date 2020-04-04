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

{ #category : #'subclass-responsibility' }
SaleListItemEditor >> children [ 
	^items
]

{ #category : #testing }
SaleListItemEditor >> hasProblems [
	self problems ifEmpty: [ ^false ] ifNotEmpty: [ ^true ]
]

{ #category : #'subclass-responsibility' }
SaleListItemEditor >> initializeComponents [
	items:= subject items collect: [ :each | SaleItemEditor subject: each ].
	
]

{ #category : #accessing }
SaleListItemEditor >> problems [
	^ self children flatCollect: #problems
]

{ #category : #adding }
SaleListItemEditor >> removeRowWith: item [
	self children do: #accept.
	subject removeItem: item.
	items:= subject items collect: [ :each | SaleItemEditor subject: each ].
	
]

{ #category : #rendering }
SaleListItemEditor >> renderContentOn: html [
	html heading level4; with: 'Productos'.
		self renderElementsTableOn: html.
		html formButton
				bePrimary;
				callback: [ self addRow ];
				with: '+'.			
		html break; break.
]

{ #category : #rendering }
SaleListItemEditor >> renderElementsTableOn: html [
	html table
		class: 'table table-hover table-sm';
		with: [ html
				tableHead: [ html
						tableRow: [ {'Producto' . 'Cantidad (Kg)' . 'Lote' . ''}
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ items
						do: [ :element | 
							html
								tableRow: [ html render: element.
									html
										tableData: [ html formButton
												beDanger;
												callback: [ self removeRowWith: element subject ];
												with: '-' ] ] ] ] ]
]
