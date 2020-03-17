Class {
	#name : #FOMCropsComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMCropsComponent >> columnHeadings [
	^ {'Nombre vulgar' . 'Rinde óptimo (kg/hectárea)'}, super columnHeadings
]

{ #category : #rendering }
FOMCropsComponent >> columnValuesFor: element [
	^ {element vulgarName.
	element optimalYield}, (super columnValuesFor: element)
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
