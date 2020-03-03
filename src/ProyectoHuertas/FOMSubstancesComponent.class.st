Class {
	#name : #FOMSubstancesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMSubstancesComponent >> asCommaSeparatedList: activeIngredients [
	^ (activeIngredients collect: #tradeName)
		ifEmpty: [ '' ]
		ifNotEmpty: [ :col | col fold: [ :a :b | a , ', ' , b ] ]
]

{ #category : #rendering }
FOMSubstancesComponent >> columnHeadings [
	^ {'Nombre comercial'. 'Uso'. 'Principios activos'. }
]

{ #category : #rendering }
FOMSubstancesComponent >> columnValuesFor: element [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {element comercialName.
	element usage.
	(self asCommaSeparatedList: element activeIngredients)}
]

{ #category : #hooks }
FOMSubstancesComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Substance 
]

{ #category : #hooks }
FOMSubstancesComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SubstanceEditor
]

{ #category : #callbacks }
FOMSubstancesComponent >> elements [
	^ (self session substances) asSortedCollection: [ :a :b | a comercialName < b comercialName ]
]

{ #category : #callbacks }
FOMSubstancesComponent >> heading [ 
	^ 'Substancias'
]
