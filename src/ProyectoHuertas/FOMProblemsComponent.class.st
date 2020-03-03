Class {
	#name : #FOMProblemsComponent,
	#superclass : #FOMEventsListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

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

{ #category : #hooks }
FOMProblemsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Problem
]

{ #category : #hooks }
FOMProblemsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ ProblemEditor
]

{ #category : #rendering }
FOMProblemsComponent >> elements [
	^ (self session problems) asSortedCollection: [ :a :b | a date > b date ]
]
