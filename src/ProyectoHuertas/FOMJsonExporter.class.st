Class {
	#name : #FOMJsonExporter,
	#superclass : #Object,
	#category : #'ProyectoHuertas-example-data'
}

{ #category : #'as yet unclassified' }
FOMJsonExporter >> buildActiveIngredient: aDic [
	| activeIngredient |
	activeIngredient:= ActiveIngredient new.
	activeIngredient tradeName: (aDic at: 'tradeName' ).
	^ activeIngredient.
]

{ #category : #'as yet unclassified' }
FOMJsonExporter >> buildSubstance: aDic [
	| substance |
	substance:= Substance new.
	substance activeIngredients: OrderedCollection new.
	substance comercialName: (aDic at: 'comercialName').
	(aDic at: 'activeIngredients') do: [ :each | 
		substance addActiveIngredients: (self buildActiveIngredient: each) ].
	(aDic at: 'withdrawalPeriodRecommendations') do: [ :each | 
		substance addWithdrawalPeriodRecommendation: (self buildWPR: each) ].
	^substance
]

{ #category : #'as yet unclassified' }
FOMJsonExporter >> buildWPR: aDic [
	| wpr |
	wpr:= WithdrawalPeriodRecommendation new.
	wpr crop: ( Crop name: (aDic at: 'crop') yield: 0 ).
	wpr daysToWait: (aDic at: 'daysToWait').
	^ wpr.
]

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
	|substances|
	substances:= OrderedCollection new.
	(NeoJSONReader fromString: json) do: [ :each | substances add: (self buildSubstance: each) ].
	^substances
]
