Class {
	#name : #FOMAbstractListForDashboardComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #hooks }
FOMAbstractListForDashboardComponent >> elementClass [
	^ Object
]

{ #category : #'as yet unclassified' }
FOMAbstractListForDashboardComponent >> elementEditorClass [
	^Object
]

{ #category : #initialization }
FOMAbstractListForDashboardComponent >> initialize [ 
	super initialize.
	paginator elementsPerPage: 5.
]

{ #category : #rendering }
FOMAbstractListForDashboardComponent >> renderContentOn: html [
	self renderElementsTableOn: html.
	paginator renderPaginationOn: html.
]

{ #category : #rendering }
FOMAbstractListForDashboardComponent >> renderElementsTableOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ self columnHeadings
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ (paginator selectElementsIn: self elementsToList)
						do: [ :element | 
							html
								tableRow: [ (self columnValuesFor: element)
										do: [ :value | html tableData: value ] ] ] ] ]
]
