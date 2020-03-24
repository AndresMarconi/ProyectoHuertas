Class {
	#name : #FOMAbstractTableWithOptionsComponent,
	#superclass : #FOMAbstractTableComponent,
	#instVars : [
		'editEnabled',
		'removeEnabled',
		'addEnabled',
		'duplicateEnabled'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #callbacks }
FOMAbstractTableWithOptionsComponent >> addElement [
	| element |
	element := self
		call: (self elementEditorClass subject: self elementClass new).
	element ifNotNil: [ :it | self saveAddedElement: it ].
	^ element
]

{ #category : #rendering }
FOMAbstractTableWithOptionsComponent >> columnHeadings [ 
	^ {'Notas' . 'Acciones' }
]

{ #category : #rendering }
FOMAbstractTableWithOptionsComponent >> columnValuesFor: element [
	^ {element comment}
]

{ #category : #callbacks }
FOMAbstractTableWithOptionsComponent >> duplicateElement: element [
	(self call: (self elementEditorClass subject: element copy))
		ifNotNil: [ :it | self saveAddedElement: it ]
]

{ #category : #callbacks }
FOMAbstractTableWithOptionsComponent >> editElement: element [
	(self call: (self elementEditorClass subject: element))
		ifNotNil: [ :it | self saveEditedElement: it ]
]

{ #category : #hooks }
FOMAbstractTableWithOptionsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ self subclassResponsibility
]

{ #category : #hooks }
FOMAbstractTableWithOptionsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ self subclassResponsibility
]

{ #category : #initialization }
FOMAbstractTableWithOptionsComponent >> initialize [
	super initialize.
	editEnabled := true.
	removeEnabled := true.
	addEnabled := true.
	duplicateEnabled := true.
]

{ #category : #accessing }
FOMAbstractTableWithOptionsComponent >> parent: anObject [
	parent := anObject
]

{ #category : #callbacks }
FOMAbstractTableWithOptionsComponent >> removeElement: element [
	element archive
]

{ #category : #rendering }
FOMAbstractTableWithOptionsComponent >> renderActionButtonsFor: element on: html [
	html
		form: [ editEnabled
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
								class: 'fa fa-trash' ] ] ]
]

{ #category : #rendering }
FOMAbstractTableWithOptionsComponent >> renderAddButtonOn: html [
	addEnabled
		ifTrue: [ html
				paragraph: [ html anchor
						callback: [ self addElement ];
						with: [ html formButton
								bePrimary;
								with: 'Agregar' ] ] ]
]

{ #category : #rendering }
FOMAbstractTableWithOptionsComponent >> renderContentOn: html [
	super renderContentOn: html.
	self renderAddButtonOn: html.
	
]

{ #category : #rendering }
FOMAbstractTableWithOptionsComponent >> renderExtraRowValue: element On: html [
	html tableData: [ self renderActionButtonsFor: element on: html ] 
]

{ #category : #hooks }
FOMAbstractTableWithOptionsComponent >> saveAddedElement: anElement [
	anElement save
]

{ #category : #hooks }
FOMAbstractTableWithOptionsComponent >> saveEditedElement: anElement [
	anElement save
]
