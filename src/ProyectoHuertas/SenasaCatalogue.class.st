Class {
	#name : #SenasaCatalogue,
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
SenasaCatalogue class >> clearSingleton [
	<script>
	singleton := nil
]

{ #category : #singleton }
SenasaCatalogue class >> singleton [
	^ singleton
		ifNil: [ singleton := self new
				addRecords: SenasaCsvReader res608year12;
				addRecords: SenasaCsvReader res934year10;
				yourself ]
]

{ #category : #accessing }
SenasaCatalogue >> activeIngredientsTradeNames [
	^ activeIngredientsTradeNames
]

{ #category : #accessing }
SenasaCatalogue >> addRecords: aCollectionOfRecords [
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

{ #category : #queries }
SenasaCatalogue >> combinedApplicabilitiesFor: aCollectionOfActiveIngredientTradeNames [
	^ (records
		flatCollect: [ :each | 
			(aCollectionOfActiveIngredientTradeNames
				includes: each activeIngredientTradeName)
				ifTrue: [ each applicabilities ]
				ifFalse: [ Set new ] ]) asSet asSortedCollection
]

{ #category : #accessing }
SenasaCatalogue >> cropVulgarNames [
	^ cropVulgarNames
]

{ #category : #initialization }
SenasaCatalogue >> initialize [
	cropVulgarNames := SortedCollection new.
	activeIngredientsTradeNames := SortedCollection new.
	records := OrderedCollection new
]

{ #category : #accessing }
SenasaCatalogue >> records [
	^ records
]

{ #category : #queries }
SenasaCatalogue >> recordsForActiveIngredientNamed: aString [
	^ (records
		select: [ :each | each activeIngredientTradeName = aString ])
		asSortedCollection: [ :a :b | 
			a activeIngredientTradeName = b activeIngredientTradeName
				ifTrue: [ a cropVulgarName < b cropVulgarName ]
				ifFalse: [ a activeIngredientTradeName < b activeIngredientTradeName ] ]
]

{ #category : #queries }
SenasaCatalogue >> recordsForCropNamed: aString [
	^ (records select: [ :each | each cropVulgarName = aString ])
		asSortedCollection: [ :a :b | 
			a cropVulgarName = b cropVulgarName
				ifTrue: [ a activeIngredientTradeName < b activeIngredientTradeName ]
				ifFalse: [ a cropVulgarName < b cropVulgarName ] ]
]

{ #category : #queries }
SenasaCatalogue >> registeredCropNamesForActiveIngredient: aTradeName [ 
	^ ((records select: [ :each | each activeIngredientTradeName  = aTradeName ])
		collect: #cropVulgarName) asSet asSortedCollection
]

{ #category : #queries }
SenasaCatalogue >> registeredIngredientsForCropNamed: aCropName [
	^ ((records select: [ :each | each cropVulgarName = aCropName ])
		collect: #activeIngredientTradeName) asSet asSortedCollection
]