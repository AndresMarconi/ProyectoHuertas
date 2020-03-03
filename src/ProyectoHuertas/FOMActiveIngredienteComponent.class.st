Class {
	#name : #FOMActiveIngredienteComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMActiveIngredienteComponent >> columnHeadings [
	^ {'Nombre' . 'URL de referencia'}
]

{ #category : #rendering }
FOMActiveIngredienteComponent >> columnValuesFor: element [
	^ {element tradeName.
	element referenceUrl}
]

{ #category : #callbacks }
FOMActiveIngredienteComponent >> editElement: element [
	^ self
]

{ #category : #accessing }
FOMActiveIngredienteComponent >> elements [
	^ Array new
]

{ #category : #printing }
FOMActiveIngredienteComponent >> printOn: aStream [
	aStream nextPutAll: 'Principios activos'
]
