Class {
	#name : #FOMActiveIngredienteComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMActiveIngredienteComponent >> columnHeadings [
	^ {'Nombre' . 'URL de referencia'}, super columnHeadings
]

{ #category : #rendering }
FOMActiveIngredienteComponent >> columnValuesFor: element [
	^ {element tradeName.
	element referenceUrl},(super columnValuesFor: element)
]

{ #category : #hooks }
FOMActiveIngredienteComponent >> elementClass [
	^ ActiveIngredient
]

{ #category : #hooks }
FOMActiveIngredienteComponent >> elementEditorClass [
	^ ActiveIngredientEditor
]

{ #category : #accessing }
FOMActiveIngredienteComponent >> elements [
	^ (self session activeIngredients) asSortedCollection: [ :a :b | a tradeName < b tradeName ]
]

{ #category : #initialization }
FOMActiveIngredienteComponent >> initialize [
	super initialize.
	duplicateEnabled := false.
	removeEnabled := false
]
