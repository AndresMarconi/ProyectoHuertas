Class {
	#name : #FarmerDashboardComponent,
	#superclass : #GAFAbstractDashboardComponent,
	#instVars : [
		'nextToHarvestComponent',
		'plotsInwithdrawalTimeComponent',
		'yieldReportsComponent',
		'newsDahboardComponent',
		'gapAlertComponent'
	],
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #initialization }
FarmerDashboardComponent >> initializeComponents [
	plotsInwithdrawalTimeComponent:=
		(DashboardCardDecorator new
				component: (PlotsInWithdrawalTimeComponent rows: 5 parent: self);
				title: 'En carencia';
				subtitle:
					'Respete las carencias correspondientes a los fitosanitarios aplicados.';
				imageUrl: GAFLibrary / #stopJpg;
				size: 6;
				yourself).
	nextToHarvestComponent:=
		(DashboardCardDecorator new
				component: (NextToHarvestComponent rows: 5 parent: self);
				title: 'Próximo a cosechar';
				subtitle:
					'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.';
				imageUrl: GAFLibrary / #harvestingpeopleJpg;
				size: 6;
				yourself).
	yieldReportsComponent:=
		(DashboardCardDecorator new
				component: (YeildReportsComponent rows: 5);
				title: 'Progreso de la cosecha';
				subtitle: 'Su rinde actual vs. el esperato y el óptimo.';
				size: 6; 
				yourself).
	newsDahboardComponent:=
		(DashboardCardDecorator new
				component: (NewsDahboardComponent rows: 5 parent: self);
				title: 'Noticias';
				subtitle: 'Ultimas noticias, seleccionadas para usted.';
				size: 6;
				yourself).
	gapAlertComponent :=
		(DashboardCardDecorator new
				component: (GAPAlertDahboardComponent rows: 5 parent: self);
				title: 'Alerta de buenas practicas';
				subtitle: 'Se encontraron los siguientes incumplimiento en buenas practicas.';
				size: 6;
				yourself).
]

{ #category : #accessing }
FarmerDashboardComponent >> widgets [ 
	^{gapAlertComponent.
	nextToHarvestComponent.
	plotsInwithdrawalTimeComponent.
	yieldReportsComponent.
	newsDahboardComponent.}
]
