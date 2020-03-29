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
ExpertDashboardComponent >> renderAsCard: aBlock titled: aTitle on: html [
	html card
		style: 'margin-bottom: 20px;';
		with: [ html
				cardBody: [ html cardTitle level5 with: aTitle.
					html cardText: aBlock ] ]
]

{ #category : #rendering }
ExpertDashboardComponent >> renderContentOn: html [
	html
		row: [ html
				column: [ self renderProblemsCardOn: html ] mediumSize: 6;
				column: [ self renderSubstancesCardOn: html ] mediumSize: 6 ];
		row: [ html
				column: [ self renderCropsCardOn: html ] mediumSize: 6;
				column:
						[ self renderReactionsCardOn: html ] mediumSize: 6 ]
]

{ #category : #rendering }
ExpertDashboardComponent >> renderCropsCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: cropsExpertDashboardComponent;
				title: 'Siembra';
				yourself)
]

{ #category : #rendering }
ExpertDashboardComponent >> renderProblemsCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: problemsExpertDashboardComponent;
				title: 'Adversidades';
				yourself)
]

{ #category : #rendering }
ExpertDashboardComponent >> renderReactionsCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: reactionsExpertDashboardComponent;
				title: 'Reacciones';
				yourself)
]

{ #category : #rendering }
ExpertDashboardComponent >> renderSubstancesCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: substancesExpertDashboardComponent;
				title: 'Uso de fitosanitarios';
				yourself)
]
