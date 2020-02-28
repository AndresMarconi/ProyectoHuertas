Class {
	#name : #FOMCultivarComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'cultivar'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMCultivarComponent class >> cultivar: aCultivar [
	| component |
	component:= self new.
	component
		cultivar: aCultivar;
		paginator: (Paginator newTotalElements: component elements perPage: 10).
	^ component
]

{ #category : #adding }
FOMCultivarComponent >> addWhiteListItem [
	| whiteListItem |
	whiteListItem := self call: (WhiteListItemEditor subject: WhiteListItem new).
	whiteListItem ifNotNil: [ :it | 
		it save. 
		cultivar addIngredient: it.
		cultivar save ]
]

{ #category : #'as yet unclassified' }
FOMCultivarComponent >> backToVarieties [
	self answer.
]

{ #category : #rendering }
FOMCultivarComponent >> columnHeadings [
	^ {'Principio activo' . 'Aptitud' . 'Residuos'}
]

{ #category : #rendering }
FOMCultivarComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Superficie (m2)' . 'Dosis'}"

	^ {element activeIngredient.
	element aptitud.
	element waste.}
]

{ #category : #accessing }
FOMCultivarComponent >> cultivar [
	^ cultivar
]

{ #category : #accessing }
FOMCultivarComponent >> cultivar: anObject [
	cultivar := anObject
]

{ #category : #callbacks }
FOMCultivarComponent >> editElement: element [
	(self call: (WhiteListItemEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMCultivarComponent >> elements [ 
	^ cultivar whiteList
]

{ #category : #initialization }
FOMCultivarComponent >> initialize [ 
]

{ #category : #rendering }
FOMCultivarComponent >> renderContentOn: html [
	html heading level: 2; with: cultivar vulgarName.
	html anchor
		callback: [ self addWhiteListItem ];
		with: [ html formButton
				bePrimary;
				with: 'Agregar principio activo al cultivo' ].
	super renderContentOn: html.
	html anchor 
		callback: [ self backToVarieties ];
		with: 'volver'
	
		

]
