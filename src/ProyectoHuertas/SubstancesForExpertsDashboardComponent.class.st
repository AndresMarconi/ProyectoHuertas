Class {
	#name : #SubstancesForExpertsDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #accessing }
SubstancesForExpertsDashboardComponent >> elements [ 
	^((self session gapAFarm users flatCollect: [ :user | user farms ]) flatCollect: [ :farm | farm aplications ]) select: [ :each | each date isAfter: ((Date today) subtractDays: 30) ]
]

{ #category : #'as yet unclassified' }
SubstancesForExpertsDashboardComponent >> inThisMonth: elements of: ingredient [
	^(elements select: [ :application | application substance activeIngredients includes: ingredient ]) size
]

{ #category : #'as yet unclassified' }
SubstancesForExpertsDashboardComponent >> inThisWeek: elements of: ingredient [
	^(elements select: [ :application | 
		(application substance activeIngredients includes: ingredient) 
		and: [ application date isAfter: ((Date today) subtractDays: 7) ] ]) size
]

{ #category : #rendering }
SubstancesForExpertsDashboardComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ self tableHeadingOn: html.
				  self renderTableBodyOn: html ].
]

{ #category : #rendering }
SubstancesForExpertsDashboardComponent >> renderTableBodyOn: html [
	| set |
	set:= self elements.
	html tableBody: [ 
		(set flatCollect: [ :application | application substance activeIngredients ]) do: [ :element | 
			html tableRow: [  
				html tableData: element. 
				html tableData: (self inThisMonth: set of: element ).
				html tableData: (self inThisWeek: set of: element )  ] ] ]
]

{ #category : #'as yet unclassified' }
SubstancesForExpertsDashboardComponent >> tableHeadingOn: html [
	html tableHead: [ 
		html tableRow: [ 
			html 
				tableHeading: 'Principio activo';
				tableHeading: 'Último mes';
				tableHeading: 'Última semana' ] ]
]

{ #category : #rendering }
SubstancesForExpertsDashboardComponent >> title [
	^ 'Uso de fitosanitarios'
]
