Class {
	#name : #ProblemsForExpertsDashboardComponent,
	#superclass : #ExpertDashboardCardComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #accessing }
ProblemsForExpertsDashboardComponent >> elements [
	^((self session gapAFarm users flatCollect: [ :user | user farms ]) flatCollect: [ :farm | farm problems ]) select: [ :each | each date isAfter: ((Date today) subtractDays: 30) ].
	
]

{ #category : #'as yet unclassified' }
ProblemsForExpertsDashboardComponent >> inthisMounth: elements of: type [
	^(elements select: [ :issue | issue type = type ]) size
]

{ #category : #'as yet unclassified' }
ProblemsForExpertsDashboardComponent >> inthisWeek: elements of: type [
	^(elements select: [ :issue | 
		issue type = type and: [ issue date isAfter: ((Date today) subtractDays: 7) ] ]) size
]

{ #category : #rendering }
ProblemsForExpertsDashboardComponent >> renderCardContentOn: html [
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
				html tableData: (self inthisMounth: set of: element ).
				html tableData: (self inthisWeek: set of: element )  ] ] ]
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
