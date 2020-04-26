Class {
	#name : #BaselineOfTestsHuertas,
	#superclass : #BaselineOf,
	#category : #BaselineOfTestsHuertas
}

{ #category : #baselines }
BaselineOfTestsHuertas >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
				parasol: spec;
				mocketry: spec;
				proyectoHuertas: spec.
			spec
				package: 'TestsHuertas'
				with: [ spec requires: #('ProyectoHuertas' 'Parasol' 'Mocketry') ].
			spec postLoadDoIt: #postLoadActions ]
]

{ #category : #baselines }
BaselineOfTestsHuertas >> mocketry: spec [
	spec
		baseline: 'Mocketry'
		with: [ spec repository: 'github://dionisiydk/Mocketry:v6.0.2' ]
]

{ #category : #baselines }
BaselineOfTestsHuertas >> parasol: spec [
	spec
		baseline: 'Parasol'
		with: [ spec
				loads: #('tests');
				repository: 'github://SeasideSt/Parasol:master/repository' ]
]

{ #category : #baselines }
BaselineOfTestsHuertas >> postLoadActions [

	GTPlayground
		edit: ''
	
	label: 'Parasol/Selenium test instructions'.
]

{ #category : #baselines }
BaselineOfTestsHuertas >> proyectoHuertas: spec [
	spec
		baseline: 'ProyectoHuertas'
		with: [ spec repository: 'github:/AndresMarconi/ProyectoHuertas' ]
]
