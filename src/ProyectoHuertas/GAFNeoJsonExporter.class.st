Class {
	#name : #GAFNeoJsonExporter,
	#superclass : #Object,
	#category : #'ProyectoHuertas-export'
}

{ #category : #initialization }
GAFNeoJsonExporter >> configureSchemasAndMappingsFor: aNeoJSONReaderOrWriter [
	aNeoJSONReaderOrWriter
		mapInstVarsFor: ActiveIngredient;
		mapInstVarsFor: Crop;
		mapInstVarsFor: WithdrawalPeriodRecommendation;
		for: WithdrawalPeriodRecommendation
			do: [ :mapping | (mapping mapInstVar: #crop) valueSchema: Crop ];
		for: #OrderedCollectionOfActiveIngredient
			customDo: [ :mapping | 
			mapping
				listOfType: OrderedCollection
				andElementSchema: ActiveIngredient ];
		for: #OrderedCollectionOfWithdrawalPeriodRecommendation
			customDo: [ :mapping | 
			mapping
				listOfType: OrderedCollection
				andElementSchema: WithdrawalPeriodRecommendation ];
		mapInstVarsFor: Substance;
		for: Substance
			do: [ :mapping | 
			(mapping mapInstVar: #activeIngredients)
				valueSchema: #OrderedCollectionOfActiveIngredient.
			(mapping mapInstVar: #withdrawalPeriodRecommendations)
				valueSchema: #OrderedCollectionOfWithdrawalPeriodRecommendation ];
		for: #OrderedCollectionOfSubstance
			customDo:
				[ :mapping | mapping listOfType: OrderedCollection andElementSchema: Substance ]
]

{ #category : #export }
GAFNeoJsonExporter >> exportSubstances: aCollectionOfSubstances [
	| writer |
	^ String
		streamContents: [ :stream | 
			writer := NeoJSONWriter on: stream.
			self configureSchemasAndMappingsFor: writer.
			writer prettyPrint: true.
			writer nextPut: aCollectionOfSubstances ]
]

{ #category : #export }
GAFNeoJsonExporter >> importSubstances: aJSONString [
	| reader |
	reader := NeoJSONReader on: aJSONString readStream.
	self configureSchemasAndMappingsFor: reader.
	^ reader nextAs: #OrderedCollectionOfSubstance
]
