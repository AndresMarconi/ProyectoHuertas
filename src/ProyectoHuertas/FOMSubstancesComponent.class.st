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
	^ {'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}
]

{ #category : #rendering }
FOMSubstancesComponent >> columnValuesFor: element [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {element comercialName.
	element brand.
	element activeIngredients.
	element waitingPeriodAfterApplication}
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
	html break.
	html anchor
		callback: [ self addSubstance ];
		with: [ html formButton
				bePrimary;
				with: 'Agregar Substancia' ]
]
