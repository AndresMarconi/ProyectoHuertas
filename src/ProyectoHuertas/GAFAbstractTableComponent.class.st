Class {
	#name : #GAFAbstractTableComponent,
	#superclass : #GAFAbstractComponent,
	#instVars : [
		'paginator'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #rendering }
GAFAbstractTableComponent >> columnHeadings [
	^ self subclassResponsibility
]

{ #category : #rendering }
GAFAbstractTableComponent >> columnValuesFor: element [
	^ self subclassResponsibility
]

{ #category : #accessing }
GAFAbstractTableComponent >> elements [
	^ self subclassResponsibility
]

{ #category : #accessing }
GAFAbstractTableComponent >> elementsToList [
	^ self elements
]

{ #category : #initialization }
GAFAbstractTableComponent >> initialize [ 
	super initialize.
	paginator := Paginator subject: self selector: #elements pageSize: 10
]

{ #category : #accessing }
GAFAbstractTableComponent >> paginator: anObject [
	paginator := anObject
]

{ #category : #accessing }
GAFAbstractTableComponent >> parent [
	^ parent
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderContentOn: html [
	self renderElementsTableOn: html.
	paginator renderPaginationOn: html.
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderElementsTableOn: html [
	html table
		class: 'table table-hover';
		with: [ self tableHeadingOn: html.
				  self renderTableBodyOn: html ]
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderExtraRowValue: element On: html [
	^nil
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderTableBodyOn: html [
	html tableBody: [ (paginator selectElementsIn: self elementsToList) do: [ :element | 
		html tableRow: [ (self columnValuesFor: element) do: [ :value | html tableData: value ].
			self renderExtraRowValue: element On: html. ] ] ]
]

{ #category : #'as yet unclassified' }
GAFAbstractTableComponent >> tableHeadingOn: html [
	html tableHead: [ 
		html tableRow: [ self columnHeadings do: [ :heading | html tableHeading: heading ] ] ]
]
