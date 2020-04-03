"
| app |
app := WAAdmin register: GAFLandingComponent asApplicationAt: 'gaf'.
app
	addLibrary: JQDeploymentLibrary;
	addLibrary: JQUiDeploymentLibrary;
	addLibrary: SBSDeploymentLibrary .
	app sessionClass: GAFSession.

"
Class {
	#name : #GAFLandingComponent,
	#superclass : #GAFAbstractComponent,
	#instVars : [
		'activeComponent',
		'loginComponent',
		'registerComponent'
	],
	#category : #'ProyectoHuertas-ui-login'
}

{ #category : #urls }
GAFLandingComponent class >> applicationName [
	^ 'gaf'
]

{ #category : #urls }
GAFLandingComponent class >> url [
	^ '/' , self applicationName
]

{ #category : #initialization }
GAFLandingComponent >> initialize [
	super initialize.
	loginComponent := LoginFormComponent new parent: self.
	registerComponent := RegisterFormComponent new parent: self.
	activeComponent := loginComponent
]

{ #category : #passwords }
GAFLandingComponent >> login: anEmailAddress withHashedPassword: aHashedPassword [
	(self session gapAFarm userWithEmail: anEmailAddress)
		ifNil: [ activeComponent problem: 'El usuario no existe' ]
		ifNotNil: [ :it | 
			(it isValidPassword: aHashedPassword)
				ifTrue: [ self proceedWith: it ]
				ifFalse: [ activeComponent problem: 'Contraseña incorrecta' ] ]
]

{ #category : #callbacks }
GAFLandingComponent >> proceedWith: aUser [
	aUser email = (self application preferenceAt: #adminEmail) trimBoth
		ifTrue: [ aUser
				isAdmin: true;
				save ].
	self session user: aUser.
	registerComponent := RegisterFormComponent new parent: self.
	loginComponent := LoginFormComponent new parent: self.
	self call: FarmerHomeComponent new
]

{ #category : #callbacks }
GAFLandingComponent >> register: anEmailAddress withHashedPassword: aHashedPassword andName: aName [
	(self session gapAFarm userWithEmail: anEmailAddress)
		ifNotNil: [ activeComponent
				problem: 'Ya existe un usuario con ese correo electrónico.'.
			^ self ].
	self
		proceedWith:
			(self session gapAFarm
				register: anEmailAddress
				withHashedPassword: aHashedPassword
				andName: aName)
]

{ #category : #rendering }
GAFLandingComponent >> renderContentOn: html [
	GAFDeployer demoMode
		ifTrue: [ self renderDemoStampOn: html ].
	html
		container: [ html break.
			html
				jumbotron: [ html
						row: [ self renderPresentationColumnOn: html.
							self renderLoginColumnOn: html ] ] ]
]

{ #category : #rendering }
GAFLandingComponent >> renderLoginColumnOn: html [
	^ html
		column: [ html render: activeComponent.
			self renderLoginOrRegisterOfferOn: html ]
		mediumSize: 6
]

{ #category : #rendering }
GAFLandingComponent >> renderLoginOrRegisterOfferOn: html [
	activeComponent == loginComponent
		ifTrue: [ html paragraph
				with: [ html text: 'Si aún no tiene cuenta, '.
					html anchor
						callback: [ activeComponent := registerComponent ];
						with: 'puede registrarse' ] ]
		ifFalse: [ html paragraph
				with: [ html text: 'Si ya tiene cuenta, '.
					html anchor
						callback: [ activeComponent := loginComponent ];
						with: 'puede ingresar con ella' ] ]
]

{ #category : #rendering }
GAFLandingComponent >> renderPresentationColumnOn: html [
	html
		column: [ html heading
				level1;
				class: 'display-4';
				with: 'GAP-a-Farm'.
			html image
				style: 'padding-bottom: 20px;';
				style: 'max-width: 100%;';
				url: GAFLibrary / #farmomaticJpeg.
			html paragraph
				class: 'lead';
				with:
					'GAP-a-Farm es un sistema minimalista para el registro de eventos de la granja hortícola, buscando el cumplimiento de las buenas practicas de agricultura.' ]
		mediumSize: 6
]
