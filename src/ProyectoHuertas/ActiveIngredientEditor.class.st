Class {
	#name : #ActiveIngredientEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'tradeNameEditorComponent',
		'referenceUrlEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ActiveIngredientEditor >> allowedNames [
	| ingredientTradeNamesForExistingCrops |
	ingredientTradeNamesForExistingCrops := (self session gapAFarm crops
		collect: #vulgarName)
		flatCollect: [ :cropVulgarName | 
			SenasaCatalogue singleton
				registeredIngredientsForCropNamed: cropVulgarName ]
		as: Set.
	^ {nil}
		,
			(ingredientTradeNamesForExistingCrops
				copyWithoutAll: (self session gapAFarm activeIngredients collect: #tradeName))
				asSortedCollection
]

{ #category : #'subclass-responsibility' }
ActiveIngredientEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {tradeNameEditorComponent.
	referenceUrlEditorComponent} , super children
]

{ #category : #'subclass-responsibility' }
ActiveIngredientEditor >> initializeComponents [
	"Initialize all property components"

	tradeNameEditorComponent := DropdownSelectPropertyEditorComponent
		id: 'surface'
		subject: subject
		selector: #surface
		label: 'Nombre'
		required: true.
	tradeNameEditorComponent
		possibleValuesBlock: [ self allowedNames ];
		instructions:
			'Solo se admiten principios activos registrados en SENASA para alguno de los cultivos existentes en el sistema'.
	referenceUrlEditorComponent := TextLinePropertyEditorComponent
		id: 'referenceUrl'
		subject: subject
		selector: #referenceUrl
		label: 'URL de referencia'
		required: false.
	super initializeComponents
]

{ #category : #rendering }
ActiveIngredientEditor >> renderContentOn: html [
	subject tradeName
		ifNotNil: [ tradeNameEditorComponent readOnly: true ].
	super renderContentOn: html
]
