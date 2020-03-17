Class {
	#name : #FOMAbstractTableComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'paginator'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #rendering }
FOMAbstractTableComponent >> columnHeadings [
	^ self subclassResponsibility
]

{ #category : #rendering }
FOMAbstractTableComponent >> columnValuesFor: element [
	^ self subclassResponsibility
]

{ #category : #accessing }
FOMAbstractTableComponent >> elements [
	^ self subclassResponsibility
]

{ #category : #accessing }
FOMAbstractTableComponent >> elementsToList [
	^ self elements
		select: [ :each | self session showArchived or: [ each archived not ] ]
]

{ #category : #initialization }
FOMAbstractTableComponent >> initialize [ 
	super initialize.
	paginator := Paginator subject: self selector: #elements pageSize: 10
]

{ #category : #accessing }
FOMAbstractTableComponent >> paginator: anObject [
	paginator := anObject
]

{ #category : #accessing }
FOMAbstractTableComponent >> parent [
	^ parent
]

{ #category : #rendering }
FOMAbstractTableComponent >> renderContentOn: html [
	self renderElementsTableOn: html.
	paginator renderPaginationOn: html.
]

{ #category : #rendering }
FOMAbstractTableComponent >> renderElementsTableOn: html [
	html table
		class: 'table table-hover';
		with: [ self tableHeadingOn: html.
				  self renderTableBodyOn: html ]
]

{ #category : #rendering }
FOMAbstractTableComponent >> renderExtraRowValue: element On: html [
	^nil
]

{ #category : #rendering }
FOMAbstractTableComponent >> renderTableBodyOn: html [
	html tableBody: [ (paginator selectElementsIn: self elementsToList) do: [ :element | 
		html tableRow: [ (self columnValuesFor: element) do: [ :value | html tableData: value ].
			self renderExtraRowValue: element On: html. ] ] ]
]

{ #category : #'as yet unclassified' }
FOMAbstractTableComponent >> tableHeadingOn: html [
	html tableHead: [ 
		html tableRow: [ self columnHeadings do: [ :heading | html tableHeading: heading ] ] ]
]
