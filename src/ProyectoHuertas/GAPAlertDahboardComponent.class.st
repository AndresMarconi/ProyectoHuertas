Class {
	#name : #GAPAlertDahboardComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #accessing }
GAPAlertDahboardComponent >> elements [ 
	^{1}
]

{ #category : #rendering }
GAPAlertDahboardComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ html
								tableHeading: 'Lote';
								tableHeading: 'Suceso';
								tableHeading: 'Detalles' ] ];
				tableBody: [ html
						tableRow: [ html
								tableData: 'Lote A-1';
								tableData: 'Cosecha registrada en tiempo de carencia';
								tableData: [ 
									html anchor
									callback: [  ];
									with: [ html formButton
										bePrimary;
										with: [ html span class: 'fa fa-eye' ] ] ] ];
						tableRow: [ html
								tableData: 'Lote A-2';
								tableData: 'Aplicacion de producto no registrado para un cultivo';
								tableData: [
									html anchor
									callback: [  ];
									with: [ html formButton
										bePrimary;
										with: [ html span class: 'fa fa-eye' ] ] ] ] ] ]
]