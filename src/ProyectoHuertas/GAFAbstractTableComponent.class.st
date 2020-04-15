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
	^ self
]

{ #category : #rendering }
GAFAbstractTableComponent >> columnValuesFor: element [
	^ self subclassResponsibility
]

{ #category : #accessing }
GAFAbstractTableComponent >> filteredElements [ 
	^self elements
]

{ #category : #initialization }
GAFAbstractTableComponent >> initialize [
	super initialize.
	paginator := Paginator subject: self selector: #filteredElements pageSize: 10.

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
	paginator renderPaginationOn: html
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderElementsTableOn: html [
	html table
		class: 'table table-hover table-sm';
		with: [ self tableHeadingOn: html.
				  self renderTableBodyOn: html ]
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderExtraRowValue: element On: html [
	^nil
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderTableBodyOn: html [
	html
		tableBody: [ (paginator selectElementsIn: self filteredElements)
				do: [ :element | 
					html tableRow:
						[ self renderTableRowFor: element on: html ] ] ]
]

{ #category : #rendering }
GAFAbstractTableComponent >> renderTableRowFor: element on: html [
	(self columnValuesFor: element)
		do: [ :value | html tableData: value ].
	
]

{ #category : #rendering }
GAFAbstractTableComponent >> tableHeadingOn: html [
	html tableHead: [ 
		html tableRow: [ self columnHeadings do: [ :heading | html tableHeading: heading ] ] ]
]
