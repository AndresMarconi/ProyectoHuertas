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
		'selectedComponent'
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
	selectedComponent := FOMDashboardComponent new
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
							{('Tablero de control' -> FOMDashboardComponent).
							('Plantación y siembra' -> FOMSowingComponent).
							('Adversidades' -> FOMProblemsComponent).
							('Aplicaciones' -> FOMApplicationsComponent).
							('Cosecha' -> FOMHarvestComponent).
							('Cronología' -> FOMEventsChronologyComponent)}
						heading: 'Eventos'
						on: html.
					self
						renderMenuBlock:
							{('Lotes' -> FOMPlotsManagementComponent).
							('Inventario' -> FOMInventoryComponent).
							('Ventas' -> FOMSalesComponent)}
						heading: 'Administración'
						on: html.
					self
						renderMenuBlock:
							{('Cultivos' -> FOMCropsComponent).
							('Fertilizantes' -> FOMFertilizerComponent).
							('Pesticidas' -> FOMPesticideComponent).
							('Principios activos' -> FOMActiveIngredienteComponent)}
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
FOMHomeComponent >> renderMenuBlock: associations heading: head on: html [
	| item |
	html div
		class: 'left-menu-heading';
		with: head.
	associations
		do: [ :ass | 
			item := html listGroupLinkedItem.
			selectedComponent species = ass value
				ifTrue: [ item beActive ].
			item
				callback: [ selectedComponent := ass value new ];
				with: ass key ]
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
