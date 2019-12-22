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

{ #category : #accessing }
FOMHomeComponent class >> applicationName [
	^'huertas'
]

{ #category : #accessing }
FOMHomeComponent class >> browseInitialize [
	(self class compiledMethodAt: #initialize) browse
]

{ #category : #initialization }
FOMHomeComponent class >> initialize [
	| app |
	
	"A trick to make sure you remember to configure the app"
	self browseInitialize.
	
	app := WAAdmin
		register: FOMHomeComponent
		asApplicationAt: self applicationName.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary.
	app configuration addParent: FOMConfiguration instance.
	app preferenceAt: #loginApp put: '' .
	app sessionClass: FOMSession
]

{ #category : #'accessing-children' }
FOMHomeComponent >> children [
	^ selectedComponent ifNil: [ {} ] ifNotNil: [ {selectedComponent} ]
]

{ #category : #callbacks }
FOMHomeComponent >> createUserResources [
	| newUser newFarm |
	newUser := FOMUser fromOIDCUser: self session authenticatedUser.
	newFarm := Farm name: 'Granja de ' , newUser fullname.
	newFarm save.
	newUser addFarm: newFarm.
	newUser save
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

{ #category : #testing }
FOMHomeComponent >> isFirstTimeUser [
	^ self session users
		noneSatisfy: [ :each | each email = self session authenticatedUser email ]
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
	self isFirstTimeUser
		ifTrue: [ self createUserResources ].
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
