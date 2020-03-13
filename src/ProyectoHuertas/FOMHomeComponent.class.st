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
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #accessing }
FOMHomeComponent class >> applicationName [
	^'huertas'
]

{ #category : #rendering }
FOMHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ self subclassResponsibility
]

{ #category : #'accessing-children' }
FOMHomeComponent >> children [
	^ selectedComponent ifNil: [ {} ] ifNotNil: [ {selectedComponent} ]
]

{ #category : #rendering }
FOMHomeComponent >> dashboardComponentClass [
	^ self subclassResponsibility
]

{ #category : #initialization }
FOMHomeComponent >> initialize [
	selectedComponent := self dashboardComponentClass new
]

{ #category : #rendering }
FOMHomeComponent >> loadDemoData [
	^self subclassResponsibility 
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
			html column: [ html render: selectedComponent ] mediumSize: 10 ].

]

{ #category : #rendering }
FOMHomeComponent >> renderDemoDataButtonOn: html [
	FOMDeployer demoMode
		ifFalse: [ ^ self ].
	html outlineButton beDanger beSmall
		callback: [ self loadDemoData ];
		with: 'Load demo data'.
	html space
]

{ #category : #rendering }
FOMHomeComponent >> renderLeftMenuOn: html [
	self subclassResponsibility
]

{ #category : #'rendering-login' }
FOMHomeComponent >> renderLoginRequiredMessageOn: html [
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
FOMHomeComponent >> renderLogoutButtonOn: html [
	^ html outlineButton bePrimary beSmall
		callback: [ self logout ];
		with: 'Salir'
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
				callback: [ selectedComponent := ass value parent: self ];
				with: ass key ]
]

{ #category : #rendering }
FOMHomeComponent >> renderNavbarOn: html [
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

{ #category : #redirecting }
FOMHomeComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	self session loginRequired
		ifTrue: [ aWARoot meta
				attributeAt: 'http-equiv' put: 'Refresh';
				content: '5;URL=''' , (self application preferenceAt: #loginApp) , '''' ]
]
