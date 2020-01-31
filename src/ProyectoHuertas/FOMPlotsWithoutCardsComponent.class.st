Class {
	#name : #FOMPlotsWithoutCardsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMPlotsWithoutCardsComponent >> printOn: aStream [
	aStream nextPutAll: 'Lotes'
]
