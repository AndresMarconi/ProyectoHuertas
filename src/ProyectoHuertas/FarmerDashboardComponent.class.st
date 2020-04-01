Class {
	#name : #FarmerDashboardComponent,
	#superclass : #GAFAbstractDashboardComponent,
	#instVars : [
		'nextToHarvestComponent',
		'plotsInwithdrawalTimeComponent',
		'yieldReportsComponent',
		'newsDahboardComponent'
	],
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #initialization }
FarmerDashboardComponent >> initializeComponents [
	plotsInwithdrawalTimeComponent:=
		(DashboardCardDecorator new
				component: PlotsInWithdrawalTimeComponent new;
				title: 'En carencia';
				subtitle:
					'Respete las carencias correspondientes a los fitosanitarios aplicados.';
				imageUrl: GAFLibrary / #stopJpg;
				size: 6;
				yourself).
	nextToHarvestComponent:=
		(DashboardCardDecorator new
				component: NextToHarvestComponent new;
				title: 'Próximo a cosechar';
				subtitle:
					'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.';
				imageUrl: GAFLibrary / #harvestingpeopleJpg;
				size: 6;
				yourself).
	yieldReportsComponent:=
		(DashboardCardDecorator new
				component: YeildReportsComponent new;
				title: 'Progreso de la cosecha';
				subtitle: 'Su rinde actual vs. el esperato y el óptimo.';
				size: 8;
				yourself).
	newsDahboardComponent:=
		(DashboardCardDecorator new
				component: NewsDahboardComponent new;
				title: 'Noticias';
				subtitle: 'Ultimas noticias, seleccionadas para usted.';
				size: 6;
				yourself)
]

{ #category : #accessing }
FarmerDashboardComponent >> widgets [ 
	^{nextToHarvestComponent.
	plotsInwithdrawalTimeComponent.
	newsDahboardComponent.
	yieldReportsComponent.}
]
