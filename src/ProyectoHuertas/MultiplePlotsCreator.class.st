Class {
	#name : #MultiplePlotsCreator,
	#superclass : #GAFEditor,
	#instVars : [
		'idPrefix',
		'idPrefixComponent',
		'surface',
		'surfaceEditorComponent',
		'numberOfPlots',
		'numberOfPlotsComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #callbacks }
MultiplePlotsCreator >> accept [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	self children do: #accept.
	self answer: self createPlots.
]

{ #category : #'subclass-responsibility' }
MultiplePlotsCreator >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {numberOfPlotsComponent.
	idPrefixComponent.
	surfaceEditorComponent}
]

{ #category : #callbacks }
MultiplePlotsCreator >> createPlots [
	^ (1 to: numberOfPlots)
		collect: [ :idx | 
			Plot
				id:
					idPrefix trimBoth , ' '
						, (idx printPaddedWith: $0 to: numberOfPlots printString size)
				surface: surface ]
]

{ #category : #accessing }
MultiplePlotsCreator >> idPrefix [
	^ idPrefix
]

{ #category : #accessing }
MultiplePlotsCreator >> idPrefix: anObject [
	idPrefix := anObject
]

{ #category : #'subclass-responsibility' }
MultiplePlotsCreator >> initializeComponents [
	"Initialize all property components"

	numberOfPlotsComponent := NumberPropertyEditorComponent
		subject: self
		selector: #numberOfPlots
		label: 'Cantidad de lotes'
		required: true.
	idPrefixComponent  := TextLinePropertyEditorComponent
		subject: self
		selector: #idPrefix
		label: 'Prefijo para el identificador de los lote'
		required: true.
	surfaceEditorComponent := NumberPropertyEditorComponent
		subject: self
		selector: #surface
		label: 'Superficie de los lotes (m2)'
		required: true.
]

{ #category : #accessing }
MultiplePlotsCreator >> numberOfPlots [
	^ numberOfPlots
]

{ #category : #accessing }
MultiplePlotsCreator >> numberOfPlots: anObject [
	numberOfPlots := anObject
]

{ #category : #accessing }
MultiplePlotsCreator >> surface [
	^ surface
]

{ #category : #accessing }
MultiplePlotsCreator >> surface: anObject [
	surface := anObject
]
