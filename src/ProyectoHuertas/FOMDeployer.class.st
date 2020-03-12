Class {
	#name : #FOMDeployer,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'oidcHost',
		'baseUrl',
		'adminEmail',
		'expertApp',
		'expertLoginApp',
		'farmerApp',
		'farmerLoginApp'
	],
	#classVars : [
		'DemoMode'
	],
	#category : #'ProyectoHuertas-deployment'
}

{ #category : #demo }
FOMDeployer class >> demoMode [
	^ DemoMode ifNil: [ DemoMode := false ]
]

{ #category : #demo }
FOMDeployer class >> demoMode: aBoolean [
	DemoMode := aBoolean
]

{ #category : #deploying }
FOMDeployer >> addLibrariesToApps [
	{farmerApp.
	farmerLoginApp.
	expertApp.
	expertLoginApp}
		do: [ :app | 
			app
				addLibrary: JQDeploymentLibrary;
				addLibrary: JQUiDeploymentLibrary;
				addLibrary: SBSDeploymentLibrary ]
]

{ #category : #accessing }
FOMDeployer >> adminEmail [
	^ adminEmail
]

{ #category : #accessing }
FOMDeployer >> adminEmail: anObject [
	adminEmail := anObject
]

{ #category : #accessing }
FOMDeployer >> baseUrl [
	^ baseUrl
]

{ #category : #accessing }
FOMDeployer >> baseUrl: anObject [
	baseUrl := anObject
]

{ #category : #accessing }
FOMDeployer >> clientId [
	^ clientId
]

{ #category : #accessing }
FOMDeployer >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
FOMDeployer >> clientSecret [
	^ clientSecret
]

{ #category : #accessing }
FOMDeployer >> clientSecret: anObject [
	clientSecret := anObject
]

{ #category : #deploying }
FOMDeployer >> configureOidc [
	{farmerApp.
	farmerLoginApp.
	expertApp.
	expertLoginApp}
		do: [ :app | 
			app sessionClass: FOMSession.
			app configuration addParent: WAOpenIdConnectConfiguration instance.
			app preferenceAt: #clientId put: clientId.
			app preferenceAt: #host put: oidcHost.
			app preferenceAt: #clientSecret put: clientSecret.
			app preferenceAt: #redirectUri put: baseUrl , 'farmer' ]
]

{ #category : #deploying }
FOMDeployer >> deploy [
	self
		deployExpertApp;
		deployExpertLoginApp;
		deployFarmerApp;
		deployFarmerLoginApp.
	self addLibrariesToApps.
	self configureOidc. 
	farmerLoginApp
		preferenceAt: #redirectUri
		put: baseUrl , 'farmer'.
	expertLoginApp
		preferenceAt: #redirectUri
		put: baseUrl , 'expert'
]

{ #category : #deploying }
FOMDeployer >> deployExpertApp [
	expertApp  := WAAdmin
		register: FOMExpertHomeComponent 
		asApplicationAt: 'expert'.
	expertApp configuration addParent: FOMConfiguration instance.
	expertApp preferenceAt: #loginApp put: 'expert-login'.
	expertApp sessionClass: FOMSession.

]

{ #category : #deploying }
FOMDeployer >> deployExpertLoginApp [
	expertLoginApp := WAAdmin
		register: FOMLoginComponent
		asApplicationAt: 'expert-login'.
	expertLoginApp configuration
		addParent: WAOpenIdConnectConfiguration instance.

]

{ #category : #deploying }
FOMDeployer >> deployFarmerApp [
	farmerApp := WAAdmin
		register: FOMFarmerHomeComponent
		asApplicationAt: 'farmer'.
	farmerApp configuration addParent: FOMConfiguration instance.
	farmerApp preferenceAt: #loginApp put: 'farmer-login'.
	farmerApp sessionClass: FOMSession.

]

{ #category : #deploying }
FOMDeployer >> deployFarmerLoginApp [
	farmerLoginApp := WAAdmin
		register: FOMLoginComponent
		asApplicationAt: 'farmer-login'.
	farmerLoginApp configuration
		addParent: WAOpenIdConnectConfiguration instance.

]

{ #category : #accessing }
FOMDeployer >> oidcHost [
	^ oidcHost
]

{ #category : #accessing }
FOMDeployer >> oidcHost: anObject [
	oidcHost := anObject
]
