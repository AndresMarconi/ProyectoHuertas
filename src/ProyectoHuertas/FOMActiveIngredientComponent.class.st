Class {
	#name : #FOMActiveIngredientComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMActiveIngredientComponent >> columnHeadings [
	^ {'Nombre' . 'URL de referencia'}, super columnHeadings
]

{ #category : #rendering }
FOMActiveIngredientComponent >> columnValuesFor: element [
	^ {element tradeName.
	element referenceUrl},(super columnValuesFor: element)
]

{ #category : #hooks }
FOMActiveIngredientComponent >> elementClass [
	^ ActiveIngredient
]

{ #category : #hooks }
FOMActiveIngredientComponent >> elementEditorClass [
	^ ActiveIngredientEditor
]

{ #category : #accessing }
FOMActiveIngredientComponent >> elements [
	^ (self session activeIngredients) asSortedCollection: [ :a :b | a tradeName < b tradeName ]
]

{ #category : #initialization }
FOMActiveIngredientComponent >> initialize [
	super initialize.
	duplicateEnabled := false.
	removeEnabled := false
]
