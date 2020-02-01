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
	self renderAsListOn: html.
	html anchor
		callback: [ self addSubstance ];
		with: [ html formButton bePrimary;
						with: 'Agregar Substancia' ]
]
