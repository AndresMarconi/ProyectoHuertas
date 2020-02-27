Class {
	#name : #FOMProblemsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMProblemsComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Problema'. 'Superficie afectada(m2)'. }
]

{ #category : #rendering }
FOMProblemsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Problema'. 'Superficie afectada(m2)'. }"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element name.
	element surface}
]

{ #category : #rendering }
FOMProblemsComponent >> editElement: element [
	(self call: (ProblemEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #rendering }
FOMProblemsComponent >> elements [
	^ (self session problems) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMProblemsComponent >> printOn: aStream [
	aStream nextPutAll: 'Adversidades'
]
