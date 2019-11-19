"
| app |
  app := WAAdmin register: FOMHomeComponent  asApplicationAt: 'fom'.
  app 	addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary. 
  app sessionClass: FOMSession.
"
Class {
	#name : #FOMHomeComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'selectedComponent',
		'plotsComponent',
		'sowingComponent',
		'harvestComponent',
		'salesComponent',
		'problemsComponent',
		'applicationsComponent',
		'varietiesComponent',
		'substancesComponent',
		'stockComponent'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'accessing-children' }
FOMHomeComponent >> children [
	^ selectedComponent ifNil: [ {} ] ifNotNil: [ {selectedComponent} ]
]

{ #category : #initialization }
FOMHomeComponent >> initialize [
	plotsComponent := FOMPlotsComponent new.
	sowingComponent := FOMSowingComponent new.
	harvestComponent := FOMHarvestComponent new.
	salesComponent := FOMSalesComponent new.
	problemsComponent := FOMProblemsComponent new.
	applicationsComponent := FOMApplicationsComponent new.
	substancesComponent := FOMSubstancesComponent new.
	varietiesComponent := FOMVarietiesComponent new.
	stockComponent := FOMStockComponent new
]

{ #category : #rendering }
FOMHomeComponent >> renderContentOn: html [
	self renderNavbarOn: html.
	html
		row: [ html column: [ self renderLeftMenuOn: html ] mediumSize: 2.
			html column: [ html render: selectedComponent ] mediumSize: 10 ]
]

{ #category : #rendering }
FOMHomeComponent >> renderLeftMenuOn: html [
	| item |
	html
		form: [ html
				listGroup: [ {plotsComponent.
					sowingComponent.
					harvestComponent.
					salesComponent.
					problemsComponent.
					applicationsComponent.
					varietiesComponent.
					substancesComponent.
					stockComponent}
						do: [ :ex | 
							item := html listGroupLinkedItem.
							selectedComponent = ex
								ifTrue: [ item beActive ].
							item
								callback: [ selectedComponent := ex ];
								with: ex printString ] ] ]
]

{ #category : #rendering }
FOMHomeComponent >> renderNavbarOn: html [
	| bar |
	bar := html navigationBar.
	bar beLight.
	bar
		with: [ html navigationBarBrand with: 'Farm-O-Matic'.
			html
				form: [ html outlineButton bePrimary  beSmall
						callback: [  ];
						with: 'Salir' ] ]
]
