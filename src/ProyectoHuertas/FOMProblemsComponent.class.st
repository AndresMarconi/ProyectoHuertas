Class {
	#name : #FOMProblemsComponent,
	#superclass : #FOMEventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMProblemsComponent >> columnHeadings [
	^ super columnHeadings , { 'Adversidad'. }, self generalColumnHeadings
]

{ #category : #rendering }
FOMProblemsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Problema'. }"

	^ (super columnValuesFor: element)
		, {(element name , ' (' , element type , ')')}, (self generalColumnValuesFor: element)
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
