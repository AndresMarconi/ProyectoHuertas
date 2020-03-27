Class {
	#name : #CropsForExpertsDashboardComponent,
	#superclass : #ExpertDashboardCardComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #accessing }
CropsForExpertsDashboardComponent >> elements [ 
	^((self session gapAFarm users flatCollect: [ :user | user farms ]) flatCollect: [ :farm | farm sowings ]) select: [ :each | each date isAfter: ((Date today) subtractDays: 30) ]
]

{ #category : #'as yet unclassified' }
CropsForExpertsDashboardComponent >> inthisMounth: elements of: crop [
	| sowings |
	sowings:= (elements select: [ :sowing | (sowing crop vulgarName) = crop ]).
	^sowings inject: 0 into: [ :sum :sowing | sum + sowing quantity magnitude] 
]

{ #category : #'as yet unclassified' }
CropsForExpertsDashboardComponent >> inthisWeek: elements of: crop [
	| sowings |
	sowings:= (elements select: [ :sowing | 
		(sowing crop vulgarName) = crop  
		and: [ sowing date isAfter: ((Date today) subtractDays: 7) ] ]).
	^ sowings inject: 0 into: [ :sum :sowing | sum + sowing quantity magnitude] 
]

{ #category : #rendering }
CropsForExpertsDashboardComponent >> renderCardContentOn: html [
	html table
		class: 'table table-hover';
		with: [ self tableHeadingOn: html.
				  self renderTableBodyOn: html ].
]

{ #category : #rendering }
CropsForExpertsDashboardComponent >> renderTableBodyOn: html [
	| set |
	set:= self elements.
	html tableBody: [ 
		(set collect: [ :sowing | sowing crop vulgarName ]) do: [ :element | 
			html tableRow: [  
				html tableData: element. 
				html tableData: (self inthisMounth: set of: element ).
				html tableData: (self inthisWeek: set of: element ) ] ] ]
]

{ #category : #'as yet unclassified' }
CropsForExpertsDashboardComponent >> tableHeadingOn: html [
	html tableHead: [ 
		html tableRow: [ 
			html 
				tableHeading: 'Cultivo';
				tableHeading: 'Último mes';
				tableHeading: 'Última semana'  ] ]
]

{ #category : #rendering }
CropsForExpertsDashboardComponent >> title [
	^ 'Plantación y siembra'
]
