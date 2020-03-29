Class {
	#name : #FarmerDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#instVars : [
		'nextToHarvestComponent',
		'plotsInwithdrawalTimeComponent',
		'yieldReportsComponent'
	],
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #initialization }
FarmerDashboardComponent >> initialize [ 
	super initialize.
	nextToHarvestComponent:= NextToHarvestComponent new.
	plotsInwithdrawalTimeComponent:= PlotsInWithdrawalTimeComponent new.
	yieldReportsComponent:= YeildReportsComponent new. 
]

{ #category : #rendering }
FarmerDashboardComponent >> renderContentOn: html [
	html
		row: [ html
				column: [ self renderNextToHarvestCardOn: html ] mediumSize: 6;
				column: [ self renderInWithdrawalCardOn: html ] mediumSize: 6 ];
		row:
				[ html column: [ self renderYieldReportsCardOn: html ] mediumSize: 8 .
				html column: [ self renderNewsCardOn: html ] mediumSize: 4]
]

{ #category : #rendering }
FarmerDashboardComponent >> renderInWithdrawalCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: plotsInwithdrawalTimeComponent;
				title: 'En carencia';
				subtitle:
					'Respete las carencias correspondientes a los fitosanitarios aplicados.';
				imageUrl: GAFLibrary / #stopJpg;
				yourself)
]

{ #category : #rendering }
FarmerDashboardComponent >> renderNewsCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: NewsDahboardComponent new;
				title: 'Noticias';
				subtitle: 'Ultimas noticias, seleccionadas para usted.';
				yourself)
]

{ #category : #rendering }
FarmerDashboardComponent >> renderNextToHarvestCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: nextToHarvestComponent;
				title: 'Próximo a cosechar';
				subtitle:
					'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.';
				imageUrl: GAFLibrary / #harvestingpeopleJpg;
				yourself)
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
FarmerDashboardComponent >> renderYieldReportsCardOn: html [
	^ html
		render:
			(DashboardCardDecorator new
				component: yieldReportsComponent;
				title: 'Rinde';
				subtitle: 'Su rinde actual vs. el esperato y el óptimo.';
				yourself)
]
