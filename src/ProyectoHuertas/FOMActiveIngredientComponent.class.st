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
	| tradeName |
	tradeName := element tradeName size > 30
		ifTrue: [ (element tradeName copyFrom: 1 to: 30) , ' ...' ]
		ifFalse: [ element tradeName ].
	^ {tradeName.
	element referenceUrl} , (super columnValuesFor: element)
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
	removeEnabled := false.
	viewEnabled := true.
]

{ #category : #callbacks }
FOMActiveIngredientComponent >> viewElement: anActiveIngredient [
	self
		call:
			(FOMActiveIngredientViewer new
				activeIngredient: anActiveIngredient;
				yourself)
]
