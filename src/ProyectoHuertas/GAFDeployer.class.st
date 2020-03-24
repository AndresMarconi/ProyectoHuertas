Class {
	#name : #GAFDeployer,
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
GAFDeployer class >> demoMode [
	^ DemoMode ifNil: [ DemoMode := true ]
]

{ #category : #demo }
GAFDeployer class >> demoMode: aBoolean [
	DemoMode := aBoolean
]

{ #category : #deploying }
GAFDeployer >> addLibrariesToApps [
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
GAFDeployer >> adminEmail [
	^ adminEmail
]

{ #category : #accessing }
GAFDeployer >> adminEmail: anObject [
	adminEmail := anObject
]

{ #category : #accessing }
GAFDeployer >> baseUrl [
	^ baseUrl
]

{ #category : #accessing }
GAFDeployer >> baseUrl: anObject [
	baseUrl := anObject
]

{ #category : #accessing }
GAFDeployer >> clientId [
	^ clientId
]

{ #category : #accessing }
GAFDeployer >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
GAFDeployer >> clientSecret [
	^ clientSecret
]

{ #category : #accessing }
GAFDeployer >> clientSecret: anObject [
	clientSecret := anObject
]

{ #category : #deploying }
GAFDeployer >> configureOidc [
	{farmerApp.
	farmerLoginApp.
	expertApp.
	expertLoginApp}
		do: [ :app | 
			app sessionClass: GAFSession.
			app configuration addParent: WAOpenIdConnectConfiguration instance.
			app preferenceAt: #clientId put: clientId.
			app preferenceAt: #host put: oidcHost.
			app preferenceAt: #clientSecret put: clientSecret.
			app preferenceAt: #redirectUri put: baseUrl , 'farmer' ]
]

{ #category : #deploying }
GAFDeployer >> deploy [
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
GAFDeployer >> deployExpertApp [
	expertApp  := WAAdmin
		register: ExpertHomeComponent 
		asApplicationAt: 'expert'.
	expertApp configuration addParent: GAFConfiguration instance.
	expertApp preferenceAt: #loginApp put: 'expert-login'.
	expertApp sessionClass: GAFSession.

]

{ #category : #deploying }
GAFDeployer >> deployExpertLoginApp [
	expertLoginApp := WAAdmin
		register: GAFLoginComponent
		asApplicationAt: 'expert-login'.
	expertLoginApp configuration
		addParent: WAOpenIdConnectConfiguration instance.

]

{ #category : #deploying }
GAFDeployer >> deployFarmerApp [
	farmerApp := WAAdmin
		register: FarmerHomeComponent
		asApplicationAt: 'farmer'.
	farmerApp configuration addParent: GAFConfiguration instance.
	farmerApp preferenceAt: #loginApp put: 'farmer-login'.
	farmerApp sessionClass: GAFSession.

]

{ #category : #deploying }
GAFDeployer >> deployFarmerLoginApp [
	farmerLoginApp := WAAdmin
		register: GAFLoginComponent
		asApplicationAt: 'farmer-login'.
	farmerLoginApp configuration
		addParent: WAOpenIdConnectConfiguration instance.

]

{ #category : #accessing }
GAFDeployer >> oidcHost [
	^ oidcHost
]

{ #category : #accessing }
GAFDeployer >> oidcHost: anObject [
	oidcHost := anObject
]
