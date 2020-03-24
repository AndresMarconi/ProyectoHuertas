Class {
	#name : #ProblemsComponent,
	#superclass : #EventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
ProblemsComponent >> columnHeadings [
	^ super columnHeadings , { 'Adversidad'. }, self generalColumnHeadings
]

{ #category : #rendering }
ProblemsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Problema'. }"

	^ (super columnValuesFor: element)
		, {(element name , ' (' , element type , ')')}, (self generalColumnValuesFor: element)
]

{ #category : #hooks }
ProblemsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Problem
]

{ #category : #hooks }
ProblemsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ ProblemEditor
]

{ #category : #rendering }
ProblemsComponent >> elements [
	^ (self session farm problems) asSortedCollection: [ :a :b | a date > b date ]
]
