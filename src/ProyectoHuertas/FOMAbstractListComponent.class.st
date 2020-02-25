Class {
	#name : #FOMAbstractListComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'paginator'
	],
	#category : #'ProyectoHuertas-ui-core'
}

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
	^ html
		form: [ html formButton
				bePrimary;
				callback: [ self editElement: element ];
				with: [ html span class: 'fa fa-pencil' ].
			html space.
			html formButton
				beDanger;
				callback: [ self removeElement: element ];
				with: [ html span class: 'fa fa-trash' ] ]
]

{ #category : #rendering }
FOMAbstractListComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ self columnHeadings , {'Comentario'.'Acciones'}
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ (paginator selectElementsIn: self elementsToList)
						do: [ :element | 
							html
								tableRow: [ (self columnValuesFor: element)
										do: [ :value | html tableData: value ].
										html tableData: element comment.
									html
										tableData:
											[ self renderActionButtonsFor: element on: html ] ] ] ] ].
			paginator renderPaginationOn: html.
]
