Class {
	#name : #ProblemsForExpertsDashboardComponent,
	#superclass : #ExpertDashboardCardComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #rendering }
ProblemsForExpertsDashboardComponent >> renderCardContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Tipo';
						tableHeading: 'Último mes';
						tableHeading: 'Última semana' ].
			html
				tableBody: [ html
						tableRow: [ html
								tableData: [ html anchor with: 'Ácaros' ];
								tableData: '36';
								tableData: '6' ];
						tableRow: [ html
								tableData: [ html anchor with: 'Hongos' ];
								tableData: '17';
								tableData: '2' ];
						tableRow: [ html
								tableData: [ html anchor with: 'Insectos' ];
								tableData: '6';
								tableData: '6' ];
						tableRow: [ html
								tableData: [ html anchor with: 'Otros' ];
								tableData: '2';
								tableData: '1' ] ] ]
]

{ #category : #rendering }
ProblemsForExpertsDashboardComponent >> title [
	^ 'Adversidades'
]
