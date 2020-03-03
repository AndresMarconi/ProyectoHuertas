Class {
	#name : #FOMCropsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMCropsComponent >> addCultivar [
	| cultivar |
	cultivar := self call: (CropEditor subject: Crop new).
	cultivar ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMCropsComponent >> columnHeadings [
	^ {'Nombre vulgar' . 'Rinde óptimo (kg/hectárea)'}
]

{ #category : #rendering }
FOMCropsComponent >> columnValuesFor: element [
	^ {element vulgarName.
	element optimalYield}
]

{ #category : #callbacks }
FOMCropsComponent >> editElement: element [
	(self call: (CropEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMCropsComponent >> elements [
	^ (self session cultivars) asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #printing }
FOMCropsComponent >> printOn: aStream [
	aStream nextPutAll: 'Cultivos'
]

{ #category : #rendering }
FOMCropsComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		paragraph: [ html anchor
				callback: [ self addCultivar ];
				with: [ html formButton
						bePrimary;
						with: 'Agregar cultivo' ] ]
]

{ #category : #'as yet unclassified' }
FOMCropsComponent >> showVariety: aCultivar [
	self call: (FOMCultivarComponent cultivar: aCultivar).
]
