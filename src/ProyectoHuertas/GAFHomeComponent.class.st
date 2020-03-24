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
	#name : #GAFHomeComponent,
	#superclass : #GAFAbstractComponent,
	#instVars : [
		'selectedComponent'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #accessing }
GAFHomeComponent class >> applicationName [
	^'huertas'
]

{ #category : #rendering }
GAFHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ self subclassResponsibility
]

{ #category : #'accessing-children' }
GAFHomeComponent >> children [
	^ selectedComponent ifNil: [ {} ] ifNotNil: [ {selectedComponent} ]
]

{ #category : #rendering }
GAFHomeComponent >> dashboardComponentClass [
	^ self subclassResponsibility
]

{ #category : #initialization }
GAFHomeComponent >> initialize [
	selectedComponent := self dashboardComponentClass new
]

{ #category : #rendering }
GAFHomeComponent >> loadDemoData [
	^self subclassResponsibility 
]

{ #category : #'rendering-login' }
GAFHomeComponent >> loginUrl [
	^ self application preferenceAt: #loginApp
]

{ #category : #callbacks }
GAFHomeComponent >> logout [
	^ self session logout
]

{ #category : #rendering }
GAFHomeComponent >> renderContentOn: html [
	self session loginRequired
		ifTrue: [ ^ self renderLoginRequiredMessageOn: html ].
	self renderNavbarOn: html.
	html
		row: [ html column: [ self renderLeftMenuOn: html ] mediumSize: 2.
			html column: [ html render: selectedComponent ] mediumSize: 10 ].

]

{ #category : #rendering }
GAFHomeComponent >> renderDemoDataButtonOn: html [
	GAFDeployer demoMode 
		ifFalse: [ ^ self ].
	html outlineButton beDanger beSmall
		callback: [ self loadStressTestDemoData ];
		with: 'Load stress test data'.
	html space.
	html outlineButton beDanger beSmall
		callback: [ self loadDashboardShowcaseDemoData ];
		with: 'Load data to showcase dashboard'.
	html space
]

{ #category : #rendering }
GAFHomeComponent >> renderLeftMenuOn: html [
	self subclassResponsibility
]

{ #category : #'rendering-login' }
GAFHomeComponent >> renderLoginRequiredMessageOn: html [
	html alert
		beWarning;
		with: [ html
				paragraph: [ html
						text: 'Su sesión ya expiró. En unos segundos lo redirigiremos a la '.
					html anchor
						url: self loginUrl;
						with: ' página de inicio. ' ] ]
]

{ #category : #rendering }
GAFHomeComponent >> renderLogoutButtonOn: html [
	^ html outlineButton bePrimary beSmall
		callback: [ self logout ];
		with: 'Salir'
]

{ #category : #rendering }
GAFHomeComponent >> renderMenuBlock: associations heading: head on: html [
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
				callback: [ selectedComponent := ass value parent: self ];
				with: ass key ]
]

{ #category : #rendering }
GAFHomeComponent >> renderNavbarOn: html [
	| bar |
	bar := html navigationBar.
	bar beLight.
	bar
		with: [ html navigationBarBrand with: self barBrand.
			html
				form: [ self renderDemoDataButtonOn: html.
					self renderLogoutButtonOn: html ] ]
]

{ #category : #style }
GAFHomeComponent >> style [
	^ '.left-menu-heading {
         position: relative;
         display: block;
         padding: .75rem 1.25rem;
         margin-bottom: -1px;
         background-color: #eae6e6;
         border: 1px solid rgba(0,0,0,.125);
      }'
]

{ #category : #redirecting }
GAFHomeComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	self session loginRequired
		ifTrue: [ aWARoot meta
				attributeAt: 'http-equiv' put: 'Refresh';
				content: '5;URL=''' , (self application preferenceAt: #loginApp) , '''' ]
]
