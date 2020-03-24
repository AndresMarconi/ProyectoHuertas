Class {
	#name : #SenasaCatalog,
	#superclass : #Object,
	#instVars : [
		'cropVulgarNames',
		'activeIngredientsTradeNames',
		'records'
	],
	#classInstVars : [
		'singleton'
	],
	#category : #'ProyectoHuertas-senasa'
}

{ #category : #singleton }
SenasaCatalog class >> singleton [
	^ singleton
		ifNil: [ singleton := self new
				addRecords: SenasaCsvReader res608year12;
				addRecords: SenasaCsvReader res934year10;
				yourself ]
]

{ #category : #accessing }
SenasaCatalog >> activeIngredientsTradeNames [
	^ activeIngredientsTradeNames
]

{ #category : #accessing }
SenasaCatalog >> addRecords: aCollectionOfRecords [
	| completeRecords |
	completeRecords := aCollectionOfRecords select: #isComplete.
	records addAll: completeRecords.
	cropVulgarNames
		addAll: (completeRecords collect: [ :each | each cropVulgarName ]).
	cropVulgarNames := cropVulgarNames asSet asSortedCollection.
	activeIngredientsTradeNames
		addAll: (completeRecords collect: [ :each | each activeIngredientTradeName ]).
	activeIngredientsTradeNames := activeIngredientsTradeNames asSet
		asSortedCollection
]

{ #category : #accessing }
SenasaCatalog >> cropVulgarNames [
	^ cropVulgarNames
]

{ #category : #initialization }
SenasaCatalog >> initialize [
	cropVulgarNames := SortedCollection new.
	activeIngredientsTradeNames := SortedCollection new.
	records := OrderedCollection new
]

{ #category : #accessing }
SenasaCatalog >> records [
	^ records
]
