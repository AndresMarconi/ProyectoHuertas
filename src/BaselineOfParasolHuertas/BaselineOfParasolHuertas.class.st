Class {
	#name : #BaselineOfParasolHuertas,
	#superclass : #BaselineOf,
	#category : #BaselineOfParasolHuertas
}

{ #category : #baselines }
BaselineOfParasolHuertas >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self
				parasol: spec;
				proyectoHuertas: spec.
			spec
				package: 'ParasolHuertas'
				with: [ spec requires: #('ProyectoHuertas' 'Parasol') ].
			spec postLoadDoIt: #postLoadActions ]
]

{ #category : #baselines }
BaselineOfParasolHuertas >> parasol: spec [
	spec
		baseline: 'Parasol'
		with: [ spec repository: 'github://SeasideSt/Parasol:master/repository' ]
]

{ #category : #baselines }
BaselineOfParasolHuertas >> postLoadActions [

	GTPlayground
		edit: ''
	
	label: 'Parasol/Selenium test instructions'.
]

{ #category : #baselines }
BaselineOfParasolHuertas >> proyectoHuertas: spec [
	spec
		baseline: 'ProyectoHuertas'
		with: [ spec repository: 'github:/AndresMarconi/ProyectoHuertas' ]
]
