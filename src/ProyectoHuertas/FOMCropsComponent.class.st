Class {
	#name : #FOMCropsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMCropsComponent >> columnHeadings [
	^ {'Nombre vulgar' . 'Rinde óptimo (kg/hectárea)'}
]

{ #category : #rendering }
FOMCropsComponent >> columnValuesFor: element [
	^ {element vulgarName.
	element optimalYield}
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
	^ (self session ahg crops) asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]
