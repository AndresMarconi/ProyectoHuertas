Class {
	#name : #FOMVarietiesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMVarietiesComponent >> addVariety [
	| variety |
	variety := self call: (VarietyEditor subject: Variety new).
	variety ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMVarietiesComponent >> columnHeadings [
	^ {'Nombre vulgar' . 'expected yield'}
]

{ #category : #rendering }
FOMVarietiesComponent >> columnValuesFor: element [
	^ {element vulgarName.
	element yield}
]

{ #category : #callbacks }
FOMVarietiesComponent >> editElement: element [
	(self call: (VarietyEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMVarietiesComponent >> elements [
	^ (self session cultivars) asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #printing }
FOMVarietiesComponent >> printOn: aStream [
	aStream nextPutAll: 'Variedades'
]

{ #category : #rendering }
FOMVarietiesComponent >> renderContentOn: html [
	super renderContentOn: html.
	html anchor. 
	html anchor
		callback: [ self addVariety  ];
		with: [ html formButton bePrimary;
						with: 'Agregar variedad' ]
]
