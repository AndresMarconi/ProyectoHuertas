Class {
	#name : #BaselineOfProyectoHuertas,
	#superclass : #BaselineOf,
	#category : #BaselineOfProyectoHuertas
}

{ #category : #baselines }
BaselineOfProyectoHuertas >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
				seaside: spec;
				bootstrap4: spec;
				voyage: spec;
				oicdForSeaside: spec.
			spec
				package: 'ProyectoHuertas'
				with: [ spec
						requires: #('Seaside3' 'Bootstrap4-Core' 'Voyage' 'OIDCForSeaside') ] ].
	self postLoadActions
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> bootstrap4: spec [
	spec
		package: 'Bootstrap4-Core'
		with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ].
	spec
		package: 'Bootstrap4-Examples'
		with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ].

]

{ #category : #baselines }
BaselineOfProyectoHuertas >> oicdForSeaside: spec [
	spec
		baseline: 'OIDCForSeaside'
		with: [ spec repository: 'github://casco/oicd-for-seaside/src' ]
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> postLoadActions [

	GTPlayground
		edit:

    '| app loginApp |	

app := WAAdmin
 register: FOMHomeComponent
 asApplicationAt: FOMHomeComponent applicationName.
app
 addLibrary: JQDeploymentLibrary;
 addLibrary: JQUiDeploymentLibrary;
 addLibrary: SBSDeploymentLibrary.	
app configuration addParent: FOMConfiguration instance.
app preferenceAt: #loginApp put: FOMLoginComponent applicationName  .
app sessionClass: FOMSession.

loginApp := WAAdmin
 register: FOMLoginComponent
 asApplicationAt: FOMLoginComponent applicationName.
loginApp
 addLibrary: JQDeploymentLibrary;
 addLibrary: JQUiDeploymentLibrary;
 addLibrary: SBSDeploymentLibrary.
loginApp sessionClass: FOMSession.
	
{ app. loginApp } do: [ :each |  	each configuration addParent: WAOpenIdConnectConfiguration instance.
    each preferenceAt: #clientId put: ''<your-client-id>''.
    each preferenceAt: #host put: ''<your-oidc-authentication-domain>''.
    each preferenceAt: #clientSecret put: ''<your-client-secret>''.
	 each preferenceAt: #redirectUri put: ''<uri-of-your-secured-app>''. ]
'
	
	label: 'Deployment scripts'.
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> seaside: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].

]

{ #category : #baselines }
BaselineOfProyectoHuertas >> voyage: spec [
	spec
		baseline: 'Voyage'
		with: [ spec repository: 'github://pharo-nosql/voyage:1.5.4/mc' ]
]
