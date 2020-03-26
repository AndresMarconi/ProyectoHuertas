Class {
	#name : #ReactionsDashboardComponent,
	#superclass : #ExpertDashboardCardComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #rendering }
ReactionsDashboardComponent >> renderCardContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Noticia';
						tableHeading: 'Comentarios' ].
			html
				tableBody: [ html
						tableRow: [ html
								tableData: [ html anchor with: 'El proyecto RUC-APS no se detiene ...' ];
								tableData: '36' ];
						tableRow: [ html
								tableData: [ html anchor
										with: 'BPAi, el portal lúdico de buenas prácticas de la UNLP' ];
								tableData: '16' ];
						tableRow: [ html
								tableData: [ html anchor
										with: 'El INTA publica manual de horticultura periurbana' ];
								tableData: '9' ];
						tableRow: [ html
								tableData: [ html anchor with: 'Tomate platense, ¿el mas rico de todos?' ];
								tableData: '6' ] ] ]
]

{ #category : #rendering }
ReactionsDashboardComponent >> title [
	^ 'Reacciones'
]