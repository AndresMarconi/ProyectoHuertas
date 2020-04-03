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

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> actionsEnabled [
	^ removeEnabled | duplicateEnabled | editEnabled | viewEnabled
]

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
	^ self actionsEnabled
		ifTrue: [ {''} ]
		ifFalse: [ {} ]
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
	(self
		call: (self elementEditorClass subject: element))
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

{ #category : #accessing }
GAFAbstractTableWithOptionsComponent >> filteredElements [
	^ filterComponent shouldFilter
		ifTrue: [ self elements
				select: [ :each | 
					((self columnValuesFor: each)
						at: (self columnHeadings indexOf: filterComponent column))
						asLowercase
						includesSubstring: filterComponent filter asLowercase ] ]
		ifFalse: [ self elements ]
]

{ #category : #initialization }
GAFAbstractTableWithOptionsComponent >> initialize [
	super initialize.
	viewEnabled := false.
	editEnabled := true.
	removeEnabled := false.
	addEnabled := true.
	duplicateEnabled := true.
	filterComponent := TableFilterComponent columns: {'Motivo'}
]

{ #category : #accessing }
GAFAbstractTableWithOptionsComponent >> parent: anObject [
	parent := anObject
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> removeElement: element [
	^ self subclassResponsibility
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderActionMenuFor: element on: html [
	html dropdown
		with: [ html formButton
				id: 'dropdownMenuButton';
				class: 'fa fa-ellipsis-v';
				dataToggle: 'dropdown'.
			html div
				class: 'dropdown-menu';
				attributeAt: 'aria-labelledby' put: 'dropdownMenuButton';
				with: [ viewEnabled
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self viewElement: element ];
								with: 'Ver' ].
					editEnabled
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self editElement: element ];
								with: 'Modificar' ].
					duplicateEnabled
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self duplicateElement: element ];
								with: 'Duplicar' ].
					removeEnabled
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self removeElement: element ];
								with: 'Eliminar' ].
					self renderSpecificActionsFor: element on: html ] ]
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

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderSpecificActionsFor: element on: html [
	^ self
]

{ #category : #rendering }
GAFAbstractTableWithOptionsComponent >> renderTableRowFor: element on: html [
	super renderTableRowFor: element on: html.
	self actionsEnabled
		ifFalse: [ ^ self ].
	html tableData: [ self renderActionMenuFor: element on: html ]
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
