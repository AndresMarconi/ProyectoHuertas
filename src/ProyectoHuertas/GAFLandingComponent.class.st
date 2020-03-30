"
| app |
app := WAAdmin register: GAFLandingComponent asApplicationAt: 'test'.
app
				addLibrary: JQDeploymentLibrary;
				addLibrary: JQUiDeploymentLibrary;
				addLibrary: SBSDeploymentLibrary 
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

{ #category : #initialization }
GAFLandingComponent >> initialize [
	super initialize.
	loginComponent := LoginFormComponent new parent: self.
	registerComponent := RegisterFormComponent new parent: self.
	activeComponent := loginComponent
]

{ #category : #'login-register' }
GAFLandingComponent >> register: aString withHashedPassword: aString2 andName: aString3 [ 
	self shouldBeImplemented.
]

{ #category : #rendering }
GAFLandingComponent >> renderContentOn: html [
	html paragraph: [  ].
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
