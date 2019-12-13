Class {
	#name : #SaleEditor,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'dateEditorComponent',
		'clientEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #adding }
SaleEditor >> addItem: sale [
	| item |
	item := self call: (SaleItemEditor subject: SaleItem newFom).
	item ifNotNil: [ :it | sale addItem: item ].
	sale save
]

{ #category : #'subclass-responsibility' }
SaleEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		clientEditorComponent}
]

{ #category : #accessing }
SaleEditor >> elements [ 
	^ subject items
]

{ #category : #'subclass-responsibility' }
SaleEditor >> initializeComponents [
	"Initialize all property components"
	
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	clientEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #client
		label: 'Cliente'
		required: true
]

{ #category : #rendering }
SaleEditor >> renderChildrenOn: html [
	self children do: [ :each | html render: each ].
	html table
		class: 'table table-hover';
		with: [ 
			html tableHead: [ 
				html tableRow: [ 	
					html tableHeading: 'Producto'.	
					html tableHeading: 'Lote'.
					html tableHeading: 'Kilo Gramos' ] ].
			html tableBody: [ self elements do: [ :element | 
				html tableRow: 	[ 
					html tableData: element product.	
					html tableData: element plot id.
					html tableData: element kilograms ] ] ] ].
	html anchor
		callback: [ self addItem: subject ];
		with: [ html formButton bePrimary;
						with: 'Agregar Item' ].
	html break
]
