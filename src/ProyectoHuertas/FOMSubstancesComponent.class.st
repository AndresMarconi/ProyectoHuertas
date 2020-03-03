Class {
	#name : #FOMSubstancesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMSubstancesComponent >> addSubstance [
	| substance |
	substance := self call: (SubstanceEditor subject: Substance new).
	substance ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMSubstancesComponent >> columnHeadings [
	^ {'Nombre comercial'. 'Componentes activos'. 'tipo'}
]

{ #category : #rendering }
FOMSubstancesComponent >> columnValuesFor: element [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {element comercialName.
	element activeIngredients.
	element type}
]

{ #category : #callbacks }
FOMSubstancesComponent >> editElement: element [
	(self call: (SubstanceEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMSubstancesComponent >> elements [
	^ (self session substances) asSortedCollection: [ :a :b | a comercialName < b comercialName ]
]

{ #category : #callbacks }
FOMSubstancesComponent >> heading [ 
	^ 'Substancias'
]

{ #category : #printing }
FOMSubstancesComponent >> printOn: aStream [
	aStream nextPutAll: 'Substancias'
]

{ #category : #rendering }
FOMSubstancesComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		paragraph: [ html anchor
				callback: [ self addSubstance ];
				with: [ html formButton
						bePrimary;
						with: 'Agregar producto' ] ]
]
