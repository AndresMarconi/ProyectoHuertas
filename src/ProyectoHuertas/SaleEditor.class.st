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
	item := self call: (SaleItemEditor subject: SaleItem new).
	item ifNotNil: [ :it | sale addItem: item ].
]

{ #category : #'subclass-responsibility' }
SaleEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
		clientEditorComponent}
]

{ #category : #callbacks }
SaleEditor >> editElement: element [
	(self call: (SaleItemEditor subject: element))
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

{ #category : #removing }
SaleEditor >> removeElement: element From: sale [
	sale removeItem: element.
	
]

{ #category : #rendering }
SaleEditor >> renderChildrenOn: html [
	super renderChildrenOn: html.
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ html tableHeading: 'Producto'.
							html tableHeading: 'Lote'.
							html tableHeading: 'Kilo Gramos'.
							html tableHeading: 'Opciones' ] ].
			html
				tableBody: [ self elements
						do: [ :element | 
							html
								tableRow: [ html tableData: element product.
									html tableData: element plot id.
									html tableData: element kilograms.
									html
										tableData: [ html formButton
												bePrimary;
												callback: [ self editElement: element ];
												with: 'Modificar'.
											html space.
											html formButton
												beDanger;
												callback: [ self removeElement: element From: subject ];
												with: 'Eliminar' ] ] ] ] ].
	html formButton
		bePrimary;
		callback: [ self addItem: subject ];
		with: 'Agregar Item'
]
