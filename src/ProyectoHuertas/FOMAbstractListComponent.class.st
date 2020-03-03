Class {
	#name : #FOMAbstractListComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'paginator',
		'editEnabled',
		'removeEnabled',
		'addEnabled'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMAbstractListComponent >> addElement [
	(self call: (self elementEditorClass subject: self elementClass new))
		ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMAbstractListComponent >> columnHeadings [
	^ self subclassResponsibility
]

{ #category : #rendering }
FOMAbstractListComponent >> columnValuesFor: element [
	^ self subclassResponsibility
]

{ #category : #callbacks }
FOMAbstractListComponent >> editElement: element [
	(self call: (self elementEditorClass subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #hooks }
FOMAbstractListComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ self subclassResponsibility
]

{ #category : #hooks }
FOMAbstractListComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ self subclassResponsibility
]

{ #category : #accessing }
FOMAbstractListComponent >> elements [
	^ self subclassResponsibility
]

{ #category : #accessing }
FOMAbstractListComponent >> elementsToList [
	^ self elements
		select: [ :each | self session showArchived or: [ each archived not ] ]
]

{ #category : #initialization }
FOMAbstractListComponent >> initialize [
	paginator := Paginator newTotalElements: self elements perPage: 10.
	editEnabled := true.
	removeEnabled := true.
	addEnabled := true
]

{ #category : #accessing }
FOMAbstractListComponent >> paginator: anObject [
	paginator := anObject
]

{ #category : #accessing }
FOMAbstractListComponent >> parent [
	^ parent
]

{ #category : #accessing }
FOMAbstractListComponent >> parent: anObject [
	parent := anObject
]

{ #category : #callbacks }
FOMAbstractListComponent >> removeElement: element [
	element archive
]

{ #category : #rendering }
FOMAbstractListComponent >> renderActionButtonsFor: element on: html [
	html
		form: [ editEnabled
				ifTrue: [ html formButton
						bePrimary;
						callback: [ self editElement: element ];
						with: [ html span class: 'fa fa-pencil' ] ].
			removeEnabled
				ifTrue: [ html space.
					html formButton
						beDanger;
						callback: [ self removeElement: element ];
						with: [ html span class: 'fa fa-trash' ] ] ]
]

{ #category : #rendering }
FOMAbstractListComponent >> renderAddButtonOn: html [
	addEnabled
		ifTrue: [ html
				paragraph: [ html anchor
						callback: [ self addElement ];
						with: [ html formButton
								bePrimary;
								with: 'Agregar' ] ] ]
]

{ #category : #rendering }
FOMAbstractListComponent >> renderContentOn: html [
	self renderElementsTableOn: html.
	paginator renderPaginationOn: html.
	self renderAddButtonOn: html
]

{ #category : #rendering }
FOMAbstractListComponent >> renderElementsTableOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ self columnHeadings , {'Notas' . 'Acciones'}
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ (paginator selectElementsIn: self elementsToList)
						do: [ :element | 
							html
								tableRow: [ (self columnValuesFor: element)
										do: [ :value | html tableData: value ].
									html tableData: element comment.
									html
										tableData: [ self renderActionButtonsFor: element on: html ] ] ] ] ]
]
