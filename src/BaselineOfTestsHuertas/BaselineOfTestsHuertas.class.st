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
				proyectoHuertas: spec.
			spec
				package: 'TestsHuertas'
				with: [ spec requires: #('ProyectoHuertas' 'Parasol') ].
			spec postLoadDoIt: #postLoadActions ]
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
