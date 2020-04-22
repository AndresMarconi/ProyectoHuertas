Class {
	#name : #EventEditor,
	#superclass : #GAFEditor,
	#instVars : [
		'dateEditorComponent',
		'plotEditorComponent',
		'timeEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
EventEditor >> children [
	^ {dateEditorComponent.
	timeEditorComponent.
	plotEditorComponent} , self eventSpecificChildren, super children
]

{ #category : #'subclass-responsibility' }
EventEditor >> eventSpecificChildren [
	^ self subclassResponsibility
]

{ #category : #initialization }
EventEditor >> initializeComponents [
	"Initialize all property components"

	super initializeComponents.
	self initializeDateEditorComponent.
	self initializeTimeEditorComponent.
	self initializePlotEditorComponent.
	self suggestDateAndTimeIfMissing
]

{ #category : #initialization }
EventEditor >> initializeDateEditorComponent [
	dateEditorComponent := DatePropertyEditorComponent
		id: 'date'
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true
]

{ #category : #'subclass-responsibility' }
EventEditor >> initializePlotEditorComponent [
	plotEditorComponent := DropdownSelectPropertyEditorComponent
		id: 'plotSelector'
		subject: subject
		selector: #plot
		label: 'Lote - Cultivo presente'
		required: true.
	plotEditorComponent
		possibleValuesBlock: [ {nil} , self plots ];
		labelsBlock: [ :each | self labelForPlot: each ]
]

{ #category : #initialization }
EventEditor >> initializeTimeEditorComponent [
	timeEditorComponent := TimeStringPropertyEditorComponent
		id: 'time'
		subject: subject
		selector: #time
		label: 'Hora'
		required: true
]

{ #category : #initialization }
EventEditor >> labelForPlot: each [
	| daysLeft |
	each ifNil: [ ^ '' ].
	^ String
		streamContents: [ :stream | 
			stream nextPutAll: each id.
			each currentCycle latestSowing
				ifNotNil: [ :it | 
					stream
						nextPutAll: ' - ';
						nextPutAll: it crop vulgarName ].
			daysLeft := each withdrawalPeriodDaysLeft.
			daysLeft > 0
				ifTrue: [ stream
						nextPutAll: ' (en carencia por ';
						nextPutAll: daysLeft printString;
						nextPutAll: ' días más)' ] ]
]

{ #category : #accessing }
EventEditor >> plots [
	^ self session farm plots asOrderedCollection
]

{ #category : #initialization }
EventEditor >> suggestDateAndTimeIfMissing [
	dateEditorComponent bufferedValue
		ifNil: [ dateEditorComponent
				bufferedValue: self session farm dateOfLatestEvent ].
	timeEditorComponent bufferedValue
		ifNil: [ timeEditorComponent
				bufferedValue: self session farm timeOfLatestEvent ]
]
