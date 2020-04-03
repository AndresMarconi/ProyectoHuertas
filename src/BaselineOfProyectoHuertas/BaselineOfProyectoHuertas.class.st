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
				neoJSON: spec.
			spec
				package: 'ProyectoHuertas'
				with: [ spec requires: #('Seaside3' 'Bootstrap4-Core' 'Voyage' 'NeoCSV') ].
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
BaselineOfProyectoHuertas >> neoJSON: spec [
	spec
		project: 'NeoJSON'
		with: [ spec
				className: 'ConfigurationOfNeoJSON';
				versionString: #stable;
				repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> postLoadActions [

	GTPlayground
		edit: '"To deploy in debug mode use this lines"

GAFDeployer new adminEmail: ''youremail@yourdomain.com''; 
	database: ''gapafarm'';
	deploy.

"Set enableTestDataLoaders: to true to get a [Load demo data] button."
GAFDeployer enableTestDataLoaders: true.
"Set demoMode: to true to get a Demo Banner."
GAFDeployer demoMode: true.

"Evaluate one of the following to set the target persistency strategy"
GAFStorage inMemory.
GAFStorage mongoLocalAt: ''gapafarm''.

"To deploy to production, in a clear image evaluate"

WAAdmin defaultServerManager adaptors
	do: [ :each | WAAdmin defaultServerManager unregister: each ].
ZnZincServerAdaptor startOn: 8080.

(WAAdmin defaultDispatcher handlers keys copyWithoutAll: #(''files''))
	do: [ :appName |
		WAAdmin defaultDispatcher
			unregister: (WAAdmin defaultDispatcher handlerAt: appName) ].
WAAdmin applicationDefaults
	removeParent: WADevelopmentConfiguration instance.

GAFDeployer new
	adminEmail: ''youremail@yourdomain.com'';
	database: ''gapafarm'';
	deploy.
WAAdmin defaultDispatcher defaultName: ''gaf''.

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
