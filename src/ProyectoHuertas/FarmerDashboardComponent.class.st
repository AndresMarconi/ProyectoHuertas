Class {
	#name : #FarmerDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#instVars : [
		'nextToHarvestComponent',
		'plotsInwithdrawalTimeComponent',
		'harvestedPlotsComponent'
	],
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #initialization }
FarmerDashboardComponent >> initialize [ 
	super initialize.
	nextToHarvestComponent:= NextToHarvestComponent new.
	plotsInwithdrawalTimeComponent:= PlotsInWithdrawalTime new.
	harvestedPlotsComponent:= HarvestedPlotsComponent new.
]

{ #category : #printing }
FarmerDashboardComponent >> printOn: aStream [
	aStream nextPutAll: 'Tablero de Control'
]

{ #category : #rendering }
FarmerDashboardComponent >> renderContentOn: html [
	html heading: self session farm name;
		 break; break;
		 row: [ 
			html column: [ html render: nextToHarvestComponent ] mediumSize: 6;
				  column: [ html render: plotsInwithdrawalTimeComponent ] mediumSize: 6 ];
		 break; break;
	 	 row: [ 
			html column: [ html render: harvestedPlotsComponent ] mediumSize: 8;
				  column: [ self renderTrendProblemsOn: html ] mediumSize: 4 ]
]

{ #category : #rendering }
FarmerDashboardComponent >> renderTrendProblemsOn: html [
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
FarmerDashboardComponent >> renderYieldOn: html [
	html text: 'aqui se mostrara un grafico comparando lo que se esperaba para cosechar y lo que se cosecho'
]
