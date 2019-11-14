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
						requires: #('Seaside3' 'Bootstrap4-Core' 'Voyage' 'OIDCForSeaside') ] ]
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> bootstrap4: spec [
	spec
		package: 'Bootstrap4-Core'
		with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ].
	spec
		package: 'Bootstrap-Examples'
		with: [ spec repository: 'github://astares/Seaside-Bootstrap4:master/src' ].

]

{ #category : #baselines }
BaselineOfProyectoHuertas >> oicdForSeaside: spec [
	spec
		baseline: 'OIDCForSeaside'
		with: [ spec repository: 'github://casco/oicd-for-seaside/src' ]
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> seaside: spec [
	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ].
	spec
		package: 'Seaside-REST-Core'
		with: [ spec repository: 'github://SeasideSt/Seaside:master/repository' ]
]

{ #category : #baselines }
BaselineOfProyectoHuertas >> voyage: spec [
	spec
		baseline: 'Voyage'
		with: [ spec repository: 'github://pharo-nosql/voyage:1.5.4/mc' ]
]
