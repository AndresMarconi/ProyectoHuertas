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
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ self columnHeadings , {'Acciones'}
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ (paginator selectElementsIn: self elementsToList)
						do: [ :element | 
							html
								tableRow: [ 
									html tableData with: [ 
										html anchor
											callback: [ self showVariety: element ];
											with: element vulgarName.
										 ].
									html tableData: element yield.
									html
										tableData:
											[ self renderActionButtonsFor: element on: html ] ] ] ] ].
			paginator renderPaginationOn: html.
	html anchor. 
	html anchor
		callback: [ self addVariety  ];
		with: [ html formButton bePrimary;
						with: 'Agregar variedad' ]
]

{ #category : #'as yet unclassified' }
FOMVarietiesComponent >> showVariety: aCultivar [
	self call: (FOMCultivarComponent cultivar: aCultivar).
]
