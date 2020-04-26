Class {
	#name : #AdversityReportsComponent,
	#superclass : #EventsTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
AdversityReportsComponent >> columnHeadings [
	^ super columnHeadings , {'Cultivo' . 'Tipificación (detalle)'}
		
]

{ #category : #rendering }
AdversityReportsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Problema'. }"

	^ (super columnValuesFor: element)
		,
			{(element crop ifNil: [ '' ] ifNotNil: [ :it | it vulgarName ]).
			(element adversityTypes asCommaString , ' ('
				, element descriptionOfAdversities , ')')}
		
]

{ #category : #hooks }
AdversityReportsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ AdversityReport
]

{ #category : #hooks }
AdversityReportsComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ AdversityReportEditor
]

{ #category : #rendering }
AdversityReportsComponent >> elements [
	^ self session farm problems
		asSortedCollection: [ :a :b | a dateAndTime > b dateAndTime ]
]

{ #category : #adding }
AdversityReportsComponent >> saveAddedElement: aCollectionOfAdversityReports [
	aCollectionOfAdversityReports
		do: [ :each | super saveAddedElement: each ]
]
