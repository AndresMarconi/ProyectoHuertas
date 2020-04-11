Class {
	#name : #GAFAbstractTableWithOptionsComponent,
	#superclass : #GAFAbstractTableComponent,
	#instVars : [
		'editEnabled',
		'removeEnabled',
		'addEnabled',
		'duplicateEnabled',
		'viewEnabled',
		'filterComponent'
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

{ #category : #testing }
GAFAbstractTableWithOptionsComponent >> addEnabled [
	^ addEnabled
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

{ #category : #testing }
GAFAbstractTableWithOptionsComponent >> duplicateEnabledFor: element [
	^ duplicateEnabled
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> editElement: element [
	(self
		call: (self elementEditorClass subject: element))
		ifNotNil: [ :it | self saveEditedElement: it ]
]

{ #category : #testing }
GAFAbstractTableWithOptionsComponent >> editEnabledFor: element [
	^ editEnabled
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
GAFAbstractTableWithOptionsComponent >> filterComponent [
	^ filterComponent
		ifNil: [ filterComponent := TableFilterComponent
				columns: (self columnHeadings copyWithout: 'Acciones') ]
]

{ #category : #accessing }
GAFAbstractTableWithOptionsComponent >> filteredElements [
	^ self filterComponent shouldFilter
		ifTrue: [ self elements
				select: [ :each | 
					((self columnValuesFor: each)
						at: (self columnHeadings indexOf: self filterComponent column))
						asLowercase
						includesSubstring: self filterComponent filter asLowercase ] ]
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

]

{ #category : #accessing }
GAFAbstractTableWithOptionsComponent >> parent: anObject [
	parent := anObject
]

{ #category : #callbacks }
GAFAbstractTableWithOptionsComponent >> removeElement: element [
	^ self subclassResponsibility
]

{ #category : #testing }
GAFAbstractTableWithOptionsComponent >> removeEnabledFor: element [
	^ removeEnabled
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
				with: [ (self viewEnabledFor: element)
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self viewElement: element ];
								with: 'Ver' ].
					(self editEnabledFor: element)
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self editElement: element ];
								with: 'Modificar' ].
					(self duplicateEnabledFor: element)
						ifTrue: [ html anchor
								class: 'dropdown-item';
								callback: [ self duplicateElement: element ];
								with: 'Duplicar' ].
					(self removeEnabledFor: element)
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
	html render: self filterComponent.
	super renderContentOn: html.
	self renderAddButtonOn: html
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

{ #category : #testing }
GAFAbstractTableWithOptionsComponent >> viewEnabledFor: element [
	^ viewEnabled
]
