Class {
	#name : #FOMAbstractListComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMAbstractListComponent >> parent [
	^ parent
]

{ #category : #accessing }
FOMAbstractListComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
FOMAbstractListComponent >> renderContentOn: html [
	html text: self printString
]
