Class {
	#name : #FOMCropsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMCropsComponent >> browseDetailsOf: element [
	
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

{ #category : #rendering }
FOMCropsComponent >> renderActionButtonsFor: element on: html [
	html
		form: [ html formButton
				bePrimary;
				callback: [ self editElement: element ];
				with: [ html span class: 'fa fa-pencil' ].
			html space.
			html formButton
				bePrimary;
				callback: [ self browseDetailsOf: element ];
				with: [ html span class: 'fa fa-flask' ].
			html space.
			html formButton
				beDanger;
				callback: [ self removeElement: element ];
				with: [ html span class: 'fa fa-trash' ] ]
]
