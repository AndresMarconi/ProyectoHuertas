"
""This is part of the initialize method on the class side""

| app |
  app := WAAdmin register: FOMHomeComponent  asApplicationAt: 'huertas'.
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
		'plotsManagementComponent',
		'sowingComponent',
		'harvestComponent',
		'salesComponent',
		'problemsComponent',
		'applicationsComponent',
		'varietiesComponent',
		'substancesComponent',
		'stockComponent',
		'dashboardComponent',
		'inventoryComponent'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMHomeComponent class >> applicationName [
	^'huertas'
]

{ #category : #'accessing-children' }
FOMHomeComponent >> children [
	^ selectedComponent ifNil: [ {} ] ifNotNil: [ {selectedComponent} ]
]

{ #category : #initialization }
FOMHomeComponent >> initialize [
	plotsComponent := FOMEventsChronologyComponent new.
	sowingComponent := FOMSowingComponent new.
	harvestComponent := FOMHarvestComponent new.
	salesComponent := FOMSalesComponent new.
	problemsComponent := FOMProblemsComponent new.
	applicationsComponent := FOMApplicationsComponent new.
	substancesComponent := FOMSubstancesComponent new.
	varietiesComponent := FOMVarietiesComponent new.
	stockComponent := FOMStockComponent new.
	dashboardComponent := FOMDashboardComponent new.
	inventoryComponent := FOMInventoryComponent new.
	plotsManagementComponent := FOMPlotsManagementComponent new.
	selectedComponent := dashboardComponent.
]

{ #category : #'rendering-login' }
FOMHomeComponent >> loginUrl [
	^ self application preferenceAt: #loginApp
]

{ #category : #callbacks }
FOMHomeComponent >> logout [
	^ self session logout
]

{ #category : #rendering }
FOMHomeComponent >> renderContentOn: html [
	self session loginRequired
		ifTrue: [ ^ self renderLoginRequiredMessageOn: html ].
	self renderNavbarOn: html.
	html
		row: [ html column: [ self renderLeftMenuOn: html ] mediumSize: 2.
			html column: [ html render: selectedComponent ] mediumSize: 10 ]
]

{ #category : #rendering }
FOMHomeComponent >> renderLeftMenuOn: html [
	html
		form: [ html
				listGroup: [ self
						renderMenuBlock:
							{dashboardComponent.
							sowingComponent.
							problemsComponent.
							applicationsComponent.
							harvestComponent.
							plotsComponent}
						heading: 'Eventos'
						on: html.
					self
						renderMenuBlock:
							{plotsManagementComponent.
							inventoryComponent.
							salesComponent}
						heading: 'Administración'
						on: html.
					self
						renderMenuBlock:
							{varietiesComponent.
							substancesComponent}
						heading: 'Catálogos'
						on: html ] ]
]

{ #category : #'rendering-login' }
FOMHomeComponent >> renderLoginRequiredMessageOn: html [
	html alert
		beWarning;
		with: [ html
				paragraph: [ html text: 'Su sesión ya expiro, '.
					html anchor
						url: self loginUrl;
						with: ' vuelva a ingresar ' ] ]
]

{ #category : #rendering }
FOMHomeComponent >> renderMenuBlock: elements heading: head on: html [
	| item |
	html div
		class: 'left-menu-heading';
		with: head.
	elements
		do: [ :component | 
			item := html listGroupLinkedItem.
			selectedComponent = component
				ifTrue: [ item beActive ].
			item
				callback: [ selectedComponent := component ];
				with: component printString ]
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
						callback: [ self logout ];
						with: 'Salir' ] ]
]

{ #category : #style }
FOMHomeComponent >> style [
	^ '.left-menu-heading {
         position: relative;
         display: block;
         padding: .75rem 1.25rem;
         margin-bottom: -1px;
         background-color: #eae6e6;
         border: 1px solid rgba(0,0,0,.125);
      }'
]
