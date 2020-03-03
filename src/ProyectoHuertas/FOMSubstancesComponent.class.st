Class {
	#name : #FOMSubstancesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMSubstancesComponent >> columnHeadings [
	^ {'Nombre comercial'. 'Componente activos'. 'Uso'}
]

{ #category : #rendering }
FOMSubstancesComponent >> columnValuesFor: element [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {element comercialName.
	element activeIngredients.
	element usage}
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
