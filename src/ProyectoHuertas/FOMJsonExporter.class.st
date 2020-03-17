Class {
	#name : #FOMJsonExporter,
	#superclass : #Object,
	#category : #'ProyectoHuertas-example-data'
}

{ #category : #'as yet unclassified' }
FOMJsonExporter >> exportSubstanceToJson [
|json|
	json:= '[ '.
	(Substance selectAll asOrderedCollection) do: [ :each | json:= json,  each exportToJson,  ', ' ].
	json at: (json size) - 1 put: $].
	^json
]

{ #category : #'as yet unclassified' }
FOMJsonExporter >> importJsonOfSubstance: json [
]
