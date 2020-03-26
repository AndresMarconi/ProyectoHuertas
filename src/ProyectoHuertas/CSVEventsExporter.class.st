Class {
	#name : #CSVEventsExporter,
	#superclass : #Object,
	#instVars : [
		'events'
	],
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #'instance creation' }
CSVEventsExporter class >> events: aCollectionOfEvents [
	^ self new events: aCollectionOfEvents
]

{ #category : #exporting }
CSVEventsExporter >> elementRowFor: each [
	self subclassResponsibility
]

{ #category : #accessing }
CSVEventsExporter >> events [
	^ events
]

{ #category : #accessing }
CSVEventsExporter >> events: anObject [
	events := anObject
]

{ #category : #exporting }
CSVEventsExporter >> export [
	| rows |
	rows := Array new writeStream.
	rows nextPut: self headerRow.
	(self events
		asSortedCollection: [ :a :b | a dateAndTime < b dateAndTime ])
		do: [ :each | rows nextPut: (self elementRowFor: each) ].
	^ String
		streamContents: [ :stream | (NeoCSVWriter on: stream) nextPutAll: rows contents ]
]

{ #category : #exporting }
CSVEventsExporter >> headerRow [
	self subclassResponsibility
]
