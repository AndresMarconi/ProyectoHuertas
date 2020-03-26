Class {
	#name : #SubstancesForExpertsDashboardComponent,
	#superclass : #ExpertDashboardCardComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #rendering }
SubstancesForExpertsDashboardComponent >> renderCardContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Principio activo';
						tableHeading: 'Último mes';
						tableHeading: 'Última semana' ].
			html
				tableBody: [ html
						tableRow: [ html
								tableData: [ html anchor with: 'acetamiprid' ];
								tableData: '80 aplicaciones';
								tableData: '0 aplicaciones' ].
					html
						tableRow: [ html
								tableData: [ html anchor with: 'imidacloprid' ];
								tableData: '20 aplicaciones';
								tableData: '20 aplicaciones' ] ] ]
]

{ #category : #rendering }
SubstancesForExpertsDashboardComponent >> title [
	^ 'Uso de fitosanitarios'
]
