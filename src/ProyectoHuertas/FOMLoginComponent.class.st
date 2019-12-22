Class {
	#name : #FOMLoginComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'class initialization' }
FOMLoginComponent class >> applicationName [
	^ 'huertas-login'
]

{ #category : #'class initialization' }
FOMLoginComponent class >> browseInitialize [
	(self class compiledMethodAt: #initialize) browse
]

{ #category : #'class initialization' }
FOMLoginComponent class >> initialize [
	| app |
	
	"A trick to make sure you remember to configure the login app"
	self browseInitialize. 
	
	app := WAAdmin
		register: FOMLoginComponent
		asApplicationAt: self applicationName.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary.
	app sessionClass: FOMSession.
	app configuration addParent: WAOpenIdConnectConfiguration instance.
	app preferenceAt: #clientId put: '<your-client-id>'.
   app preferenceAt: #host put: '<your-oidc-authentication-domain'.
   app preferenceAt: #clientSecret put: '<your-client-secret>'.
	app preferenceAt: #redirectUri put: '<uri-of-your-secured-app>'
]

{ #category : #rendering }
FOMLoginComponent >> renderContentOn: html [
	html
		paragraph: [ html anchor
				url: self session oidcUrl;
				with: 'login' ]
]
