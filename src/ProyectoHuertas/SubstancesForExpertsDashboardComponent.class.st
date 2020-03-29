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
SubstancesForExpertsDashboardComponent >> inthisMounth: elements of: ingredient [
	^(elements select: [ :application | (application substance activeIngredient) = ingredient  ]) size
]

{ #category : #'as yet unclassified' }
SubstancesForExpertsDashboardComponent >> inthisWeek: elements of: ingredient [
	^(elements select: [ :application | 
		(application substance activeIngredient) = ingredient 
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
		(set collect: [ :application | application substance activeIngredient ]) do: [ :element | 
			html tableRow: [  
				html tableData: element. 
				html tableData: (self inthisMounth: set of: element ).
				html tableData: (self inthisWeek: set of: element )  ] ] ]
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
