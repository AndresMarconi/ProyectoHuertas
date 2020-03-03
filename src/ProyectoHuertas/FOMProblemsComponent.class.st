Class {
	#name : #FOMProblemsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMProblemsComponent >> addEvent [
	| editedEvent |
	editedEvent := self call: (ProblemEditor subject: Problem new).
	editedEvent
		ifNotNil: [ :it | 
			it save.
			it plot addEvent: it.
			it plot save ]
]

{ #category : #rendering }
FOMProblemsComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Superficie afectada(m2)'. }
]

{ #category : #rendering }
FOMProblemsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Problema'. }"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element name}
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

{ #category : #rendering }
FOMProblemsComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		paragraph: [ html anchor
				callback: [ self addEvent ];
				with: [ html formButton
						bePrimary;
						with: 'Registrar adversidad' ] ]
]
