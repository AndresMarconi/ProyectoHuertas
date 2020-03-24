Class {
	#name : #GAFAbstractTableWithOptionsComponent,
	#superclass : #GAFAbstractTableComponent,
	#instVars : [
		'editEnabled',
		'removeEnabled',
		'addEnabled',
		'duplicateEnabled',
		'viewEnabled'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> addElement [
	| element |
	element := self
		call: (self elementEditorClass subject: self elementClass new).
	element ifNotNil: [ :it | self saveAddedElement: it ].
	^ element
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> columnHeadings [ 
	^ {'Acciones' }
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> columnValuesFor: element [
	^ {}
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> duplicateElement: element [
	(self call: (self elementEditorClass subject: element copy))
		ifNotNil: [ :it | self saveAddedElement: it ]
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> editElement: element [
	(self call: (self elementEditorClass subject: element))
		ifNotNil: [ :it | self saveEditedElement: it ]
]

{ #category : #hooks }
GAFAbstractTableWithOptionsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ self subclassResponsibility
]

{ #category : #hooks }
GAFAbstractTableWithOptionsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ self subclassResponsibility
]

{ #category : #initialization }
GAFAbstractTableWithOptionsComponent >> initialize [
	super initialize.
	viewEnabled := false. 
	editEnabled := true.
	removeEnabled := true.
	addEnabled := true.
	duplicateEnabled := true.

]

{ #category : #accessing }
GAFAbstractTableWithOptionsComponent >> parent: anObject [
	parent := anObject
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> removeElement: element [
	element archive
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderActionButtonsFor: element on: html [
	html
		form: [ viewEnabled 
				ifTrue: [ html formButton
						style: 'margin: 2px;';
						bePrimary;
						callback: [ self viewElement: element ];
						with: [ html span
								attributeAt: 'title' put: 'Ver';
								class: 'fa fa-eye' ] ].
			editEnabled
				ifTrue: [ html formButton
						style: 'margin: 2px;';
						bePrimary;
						callback: [ self editElement: element ];
						with: [ html span
								attributeAt: 'title' put: 'Modificar';
								class: 'fa fa-pencil' ] ].
			duplicateEnabled
				ifTrue: [ html formButton
						style: 'margin: 2px;';
						bePrimary;
						callback: [ self duplicateElement: element ];
						with: [ html span
								attributeAt: 'title' put: 'Duplicar';
								class: 'fa fa-clone' ] ].
			removeEnabled
				ifTrue: [ html formButton
						style: 'margin: 2px;';
						beDanger;
						callback: [ self removeElement: element ];
						with: [ html span
								attributeAt: 'title' put: 'Eliminar';
								class: 'fa fa-trash' ] ].
			self renderCustomActionButtonsFor: element on: html ]
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderAddButtonOn: html [
	addEnabled
		ifTrue: [ html
				paragraph: [ html anchor
						callback: [ self addElement ];
						with: [ html formButton
								bePrimary;
								with: 'Agregar' ] ] ]
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderAddButtonOn: html.
	
]

{ #category : #hooks }
GAFAbstractTableWithOptionsComponent >> renderCustomActionButtonsFor: element on: html [
	^ self
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderExtraRowValue: element On: html [
	html tableData: [ self renderActionButtonsFor: element on: html ] 
]

{ #category : #hooks }
GAFAbstractTableWithOptionsComponent >> saveAddedElement: anElement [
	anElement save
]

{ #category : #hooks }
GAFAbstractTableWithOptionsComponent >> saveEditedElement: anElement [
	anElement save
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> viewElement: element [
	^ self
]
