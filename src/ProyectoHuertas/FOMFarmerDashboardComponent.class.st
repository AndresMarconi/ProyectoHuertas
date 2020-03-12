Class {
	#name : #FOMFarmerDashboardComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'period'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #initialization }
FOMFarmerDashboardComponent >> initialize [ 
	super initialize.
	self perWeek
]

{ #category : #'as yet unclassified' }
FOMFarmerDashboardComponent >> nextToHarvest [
 | sowings |
	sowings:= self session sowings. 
	sowings:= sowings select: [ :each | (each harvestDate) isAfter: (Date today) ].
	((sowings size) < 5)
		ifTrue: [ ^sowings first: sowings size ]
		ifFalse: [ ^sowings ]

]

{ #category : #'as yet unclassified' }
FOMFarmerDashboardComponent >> perMounth [
	period:= 30
]

{ #category : #'as yet unclassified' }
FOMFarmerDashboardComponent >> perWeek [
	period:= 7
]

{ #category : #printing }
FOMFarmerDashboardComponent >> printOn: aStream [
	aStream nextPutAll: 'Tablero de Control'
]

{ #category : #rendering }
FOMFarmerDashboardComponent >> renderContentOn: html [
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
FOMFarmerDashboardComponent >> renderNextToHarvest: nextToHarvest On: html [
	html paragraph: 'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.'.
	html unorderedList: [ nextToHarvest do: [ :each | 
		html listItem: [ html
			strong: each plot;
			text: ' La cosecha iniciara ', (each harvestDate) ddmmyyyy,' hasta el ', (each harvestPeriod) 			ddmmyyyy , ': continúa la cosecha de ', each crop printString ] ] ]
]

{ #category : #rendering }
FOMFarmerDashboardComponent >> renderPlotsNotToHarvestOn: html [
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
FOMFarmerDashboardComponent >> renderPlotsToHarvestOn: html [
	html row:[
		html heading level5; with: 'Cosecha'.
		html space. self renderSelectionPeriodOn: html ].
	(self toHarvestSoon) 
		ifEmpty: [ 
			(self nextToHarvest)
				ifEmpty: [ html text: 'No hay ningun lote sembrado o plantado' ] 
				ifNotEmpty: [ :it | self renderNextToHarvest: it On: html ] ] 
		ifNotEmpty: [ :it | self renderSoonToHarvest: it On: html ]
]

{ #category : #rendering }
FOMFarmerDashboardComponent >> renderSelectionPeriodOn: html [
		
		html space.
		html anchor
			callback: [ self perWeek ];
			with: ' esta semana '.
		html space.
		html text: ' | '.
		html space.
		html anchor
			callback: [ self perMounth ];
			with: ' este mes '.
]

{ #category : #rendering }
FOMFarmerDashboardComponent >> renderSoonToHarvest: soonToHarvest On: html [
	html paragraph: 'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.'.
	html unorderedList: [ soonToHarvest do: [ :each | 
		html listItem: [ html
			strong: each plot;
			text: ' La cosecha iniciara ', (each harvestDate) ddmmyyyy,' hasta el ', (each harvestPeriod) 			ddmmyyyy , ': continúa la cosecha de ', each crop printString ] ] ]
]

{ #category : #rendering }
FOMFarmerDashboardComponent >> renderTrendProblemsOn: html [
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
FOMFarmerDashboardComponent >> renderYieldOn: html [
	html text: 'aqui se mostrara un grafico comparando lo que se esperaba para cosechar y lo que se cosecho'
]

{ #category : #'as yet unclassified' }
FOMFarmerDashboardComponent >> toHarvestSoon [
 | sowings |
	sowings:= self session sowings. 
	sowings:= sowings select: [ :each | (each harvestDate) isAfter: (Date today) ].
	sowings:= sowings select: [ :each | (each harvestDate) isBefore: ((Date today) addDays: period) ].
	^sowings

]
