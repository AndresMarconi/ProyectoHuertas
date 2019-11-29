Class {
	#name : #FOMProblemsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMProblemsComponent >> editElement: element [
	(self call: (ProblemEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMProblemsComponent >> elements [
	^ (Problem selectAll) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #rendering }
FOMProblemsComponent >> heading [ 
	^ 'Problemas'
]

{ #category : #printing }
FOMProblemsComponent >> printOn: aStream [
	aStream nextPutAll: 'Problemas'
]

{ #category : #rendering }
FOMProblemsComponent >> renderContentOn: html [
	self listTempleteOn: html
]
