Class {
	#name : #ProblemsForExpertsDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #accessing }
ProblemsForExpertsDashboardComponent >> elements [
	^((self session gapAFarm users flatCollect: [ :user | user farms ]) flatCollect: [ :farm | farm problems ]) select: [ :each | each date isAfter: ((Date today) subtractDays: 30) ].
	
]

{ #category : #'as yet unclassified' }
ProblemsForExpertsDashboardComponent >> inThisMonth: elements of: type [
	^(elements select: [ :issue | issue type = type ]) size
]

{ #category : #'as yet unclassified' }
ProblemsForExpertsDashboardComponent >> inThisWeek: elements of: type [
	^(elements select: [ :issue | 
		issue type = type and: [ issue date isAfter: ((Date today) subtractDays: 7) ] ]) size
]

{ #category : #rendering }
ProblemsForExpertsDashboardComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ self tableHeadingOn: html.
				  self renderTableBodyOn: html ].
]

{ #category : #rendering }
ProblemsForExpertsDashboardComponent >> renderTableBodyOn: html [
	| set |
	set:= self elements.
	html tableBody: [ 
		(set collect: [ :issue | issue type ]) do: [ :element | 
			html tableRow: [  
				html tableData: element. 
				html tableData: (self inThisMonth: set of: element ).
				html tableData: (self inThisWeek: set of: element )  ] ] ]
]

{ #category : #'as yet unclassified' }
ProblemsForExpertsDashboardComponent >> tableHeadingOn: html [
	html tableHead: [ 
		html tableRow: [ 
			html 
				tableHeading: 'Tipo';
				tableHeading: 'Último mes';
				tableHeading: 'Última semana' ] ]
]

{ #category : #rendering }
ProblemsForExpertsDashboardComponent >> title [
	^ 'Adversidades'
]
