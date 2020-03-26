Class {
	#name : #CropsForExpertsDashboardComponent,
	#superclass : #ExpertDashboardCardComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #rendering }
CropsForExpertsDashboardComponent >> renderCardContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Cultivo';
						tableHeading: 'Último mes';
						tableHeading: 'Última semana' ].
			html
				tableBody: [ html
						tableRow: [ html
								tableData: [ html anchor with: 'Tomate' ];
								tableData: '36.000 plantas';
								tableData: '6000 plantas' ].
					html
						tableRow: [ html
								tableData: [ html anchor with: 'Pimiento' ];
								tableData: '15.800 plantas';
								tableData: '2000 plantas' ].
					html
						tableRow: [ html
								tableData: [ html anchor with: 'Lechuga' ];
								tableData: '100.000 plantas';
								tableData: '1000 plantas' ] ] ]
]

{ #category : #rendering }
CropsForExpertsDashboardComponent >> title [
	^ 'Plantación y siembra'
]
