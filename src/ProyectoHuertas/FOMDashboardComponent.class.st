Class {
	#name : #FOMDashboardComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMDashboardComponent >> printOn: aStream [
	aStream nextPutAll: 'Panel de Control'
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
			html column: [ self renderYieldOn: html ] mediumSize: 8;
				  column: [ self renderTrendProblemsOn: html ] mediumSize: 4 ]
]

{ #category : #rendering }
FOMDashboardComponent >> renderPlotsNotToHarvestOn: html [
	html text: 'aqui se mostrara una lista con los lotes que no se pueden cosechar'
]

{ #category : #rendering }
FOMDashboardComponent >> renderPlotsToHarvestOn: html [
	html text: 'aqui se mostrara una lista con los lotes con fecha de cosechar proxima'
]

{ #category : #rendering }
FOMDashboardComponent >> renderTrendProblemsOn: html [
	html text: 'aqui se mostrara una lista con los problemas que mas esten afectando a las granjas'
]

{ #category : #rendering }
FOMDashboardComponent >> renderYieldOn: html [
	html text: 'aqui se mostrara un grafico comparando lo que se esperaba para cosechar y lo que se cosecho'
]
