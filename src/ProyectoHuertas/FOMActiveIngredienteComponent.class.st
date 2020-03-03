Class {
	#name : #FOMActiveIngredienteComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMActiveIngredienteComponent >> elements [
	^ Array new
]

{ #category : #printing }
FOMActiveIngredienteComponent >> printOn: aStream [
	aStream nextPutAll: 'Principios activos'
]
