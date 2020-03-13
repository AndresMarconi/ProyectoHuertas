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
				gettext: spec;
				neoCSV: spec;
				oicdForSeaside: spec.
			spec
				package: 'ProyectoHuertas'
				with: [ spec
						requires: #('Seaside3' 'Bootstrap4-Core' 'Voyage' 'OIDCForSeaside') ].
			spec postLoadDoIt: #postLoadActions ]
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
BaselineOfProyectoHuertas >> gettext: spec [
	spec
		baseline: 'Gettext'
		with: [ spec repository: 'github://pharo-contributions/Gettext/source' ]
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> neoCSV: spec [
	spec
		baseline: 'NeoCSV'
		with: [ spec repository: 'github://svenvc/NeoCSV/repository' ]
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
		edit: '"Edit and valuate the following expresion to deploy your apps. 
Applications will be available at:
		
		<uri-base-for-your-apps>/farmer-login
		<uri-base-for-your-apps>/farmer
		<uri-base-for-your-apps>/expert-login
		<uri-base-for-your-apps>/expert"
		
FOMDeployer new 
     clientId: ''<your-client-id>'';
     oidcHost: ''<your-oidc-authentication-domain>'';
     clientSecret: ''<your-client-secret>'';    
     baseUrl: ''<uri-base-for-your-apps>/'';
     adminEmail: ''<email-of-the-first-admin>'';
     deploy.'
	
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
