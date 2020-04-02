Class {
	#name : #GAFJsonExporter,
	#superclass : #Object,
	#category : #'ProyectoHuertas-export'
}

{ #category : #'creating objects' }
GAFJsonExporter >> buildActiveIngredient: aDic [
	| activeIngredient |
	activeIngredient:= ActiveIngredient new.
	activeIngredient tradeName: (aDic at: 'tradeName' ).
	^ activeIngredient.
]

{ #category : #'creating objects' }
GAFJsonExporter >> buildSubstance: aDic [
	| substance |
	substance:= Substance new.
	substance comercialName: (aDic at: 'comercialName').
	(aDic at: 'activeIngredients') do: [ :each | 
		substance addActiveIngredient: (self buildActiveIngredient: each) ].
	(aDic at: 'withdrawalPeriodRecommendations') do: [ :each | 
		substance addWithdrawalRecommendation: (self buildWPR: each) ].
	^substance
]

{ #category : #'creating objects' }
GAFJsonExporter >> buildWPR: aDic [
	| wpr |
	wpr:= WithdrawalPeriodRecommendation new.
	wpr crop: ( Crop name: (aDic at: 'crop') yield: 0 ).
	wpr daysToWait: (aDic at: 'daysToWait').
	^ wpr.
]

{ #category : #operations }
GAFJsonExporter >> exportSubstanceToJson [
|json|
	json:= '[ '.
	(Substance selectAll asOrderedCollection) do: [ :each | json:= json,  each exportToJson,  ', ' ].
	json at: (json size) - 1 put: $].
	^json
]

{ #category : #operations }
GAFJsonExporter >> importJsonOfSubstance: json [
	|substances|
	substances:= OrderedCollection new.
	(NeoJSONReader fromString: json) do: [ :each | substances add: (self buildSubstance: each) ].
	^substances
]
