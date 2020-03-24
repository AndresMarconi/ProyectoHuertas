Class {
	#name : #FOMCropsComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #adding }
FOMCropsComponent >> addElement [
	| theCrop |
	theCrop := super addElement.
	theCrop
		ifNotNil: [ (self userAcceptsToBatchAddIngredientesFor: theCrop)
				ifTrue: [ self batchAddIngredientsForCrop: theCrop ] ].
	^ theCrop
]

{ #category : #callbacks }
FOMCropsComponent >> batchAddIngredientsForCrop: aCrop [
	self call: (FOMBachAddActiveIngredientsComponent crop: aCrop)
]

{ #category : #rendering }
FOMCropsComponent >> columnHeadings [
	^ {'Nombre vulgar' . 'Rinde óptimo (kg/hectárea)'}, super columnHeadings
]

{ #category : #rendering }
FOMCropsComponent >> columnValuesFor: element [
	^ {element vulgarName.
	element optimalYieldPerPlant}, (super columnValuesFor: element)
]

{ #category : #hooks }
FOMCropsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Crop
]

{ #category : #hooks }
FOMCropsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ CropEditor
]

{ #category : #callbacks }
FOMCropsComponent >> elements [
	^ (self session crops) asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #initialization }
FOMCropsComponent >> initialize [
	super initialize.
	duplicateEnabled := false.
	removeEnabled := false
]

{ #category : #adding }
FOMCropsComponent >> userAcceptsToBatchAddIngredientesFor: aCrop [
	^ self
		confirm:
			aCrop vulgarName
				,
					' se agregó con éxito, ¿quiere agregar los principios activos registrados para el mismo?'
]
