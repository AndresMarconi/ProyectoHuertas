Class {
	#name : #NewsDahboardComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
NewsDahboardComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableBody: [ html
						tableRow: [ html
								tableData: [ html anchor
										url: '';
										with: 'El proyecto RUC-APS no se detiene ...' ] ];
						tableRow: [ html
								tableData: [ html anchor
										url: '';
										with: 'BPAi, el portal lúdico de buenas prácticas de la UNLP' ] ];
						tableRow: [ html
								tableData: [ html anchor
										url: '';
										with: 'El INTA publica manual de horticultura periurbana' ] ];
						tableRow: [ html
								tableData: [ html anchor
										url: '';
										with: 'Tomate platense, ¿el mas rico de todos?' ] ] ] ]
]
