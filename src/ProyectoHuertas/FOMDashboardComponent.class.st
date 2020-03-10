Class {
	#name : #FOMDashboardComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMDashboardComponent >> printOn: aStream [
	aStream nextPutAll: 'Tablero de Control'
]

{ #category : #rendering }
FOMDashboardComponent >> renderContentOn: html [
	html heading: self session farm name;
		 break; break;
		 row: [ 
			html column: [ self renderPlotsToHarvestOn: html ] mediumSize: 6;
				  column: [ self renderPlotsNotToHarvestOn: html ] mediumSize: 6 ];
		 break; break;
	 	 row: [ 
			html column: [ self renderYieldOn: html ] mediumSize: 6;
				  column: [ self renderTrendProblemsOn: html ] mediumSize: 6 ]
]

{ #category : #rendering }
FOMDashboardComponent >> renderPlotsNotToHarvestOn: html [
	html heading
		level5;
		with: 'Carencias'.
	html
		paragraph:
			'Respete las carencias correspondientes a los fitosanitarios aplicados.'.
	html
		unorderedList: [ html
				listItem: [ html
						strong: 'Lote 01:';
						text: ' hasta 12/12/21 por aplicación de Strike' ];
				listItem: [ html
						strong: 'Lote 02:';
						text: ' hasta 12/12/21 por aplicación de Strike' ];
				listItem: [ html
						strong: 'Lote 03:';
						text: ' hasta 12/12/21 por aplicación de Strike' ] ]
]

{ #category : #rendering }
FOMDashboardComponent >> renderPlotsToHarvestOn: html [

	html heading
		level5;
		with: 'Cosecha'.
	html
		paragraph:
			'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.'.
	html
		unorderedList: [ html
				listItem: [ html
						strong: 'Lote 01: ';
						text: 'hasta el 02/03/2022: continúa la cosecha de Tomate (Tomate platense)' ];
				listItem: [ html
						strong: 'Lote 02: ';
						text: '12/12/21: iniciaría la cosecha del Pimiento' ];
				listItem: [ html
						strong: 'Lote 03: ';
						text: '1/12/21: iniciaría la cosecha de Lechuga (Lechuga mantecosa)' ] ]
]

{ #category : #rendering }
FOMDashboardComponent >> renderTrendProblemsOn: html [
	html heading
		level5;
		with: 'Ranking de adversidades'.
	html
		paragraph:
			'Las siguientes adversidades han sido reportadas recientemente por sus colegas productores y por expertos.'.
	html
		unorderedList: [ html
				listItem: [ html
						strong: 'Peste negra:';
						text:
							' 20 productores reportan haber detectado peste negra en Pimiento en los últimos días.' ];
				listItem: [ html
						strong: 'Acaros:';
						text:
							' se han reportado casos de ácaros en tomate en los últimos días.' ];
				listItem: [ html
						strong: '...';
						text: ' ...' ] ]
]

{ #category : #rendering }
FOMDashboardComponent >> renderYieldOn: html [
	html text: 'aqui se mostrara un grafico comparando lo que se esperaba para cosechar y lo que se cosecho'
]
