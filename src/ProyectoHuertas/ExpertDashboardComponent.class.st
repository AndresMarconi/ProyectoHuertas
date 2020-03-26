Class {
	#name : #ExpertDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#instVars : [
		'reactionsExpertDashboardComponent',
		'cropsExpertDashboardComponent',
		'problemsExpertDashboardComponent',
		'substancesExpertDashboardComponent'
	],
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #initialization }
ExpertDashboardComponent >> initialize [
	super initialize.
	reactionsExpertDashboardComponent := ReactionsDashboardComponent new.
	problemsExpertDashboardComponent := ProblemsForExpertsDashboardComponent
		new.
	cropsExpertDashboardComponent := CropsForExpertsDashboardComponent
		new.
	substancesExpertDashboardComponent := SubstancesForExpertsDashboardComponent
		new
]

{ #category : #rendering }
ExpertDashboardComponent >> renderContentOn: html [
	html
		row: [ html
				column: [ html render: problemsExpertDashboardComponent ]
					mediumSize: 6;
				column: [ html render: substancesExpertDashboardComponent ]
					mediumSize: 6 ];
		row: [ html
				column: [ html render: cropsExpertDashboardComponent ]
					mediumSize: 6;
				column: [ html render: reactionsExpertDashboardComponent ]
					mediumSize: 6 ]
]
