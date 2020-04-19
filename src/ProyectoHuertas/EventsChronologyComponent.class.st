Class {
	#name : #EventsChronologyComponent,
	#superclass : #GAFAbstractTableWithFilterAndActionsComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #accessing }
EventsChronologyComponent class >> plot: aPlot [
	| component |
	component := self new.
	component plot: aPlot.
	^ component
]

{ #category : #rendering }
EventsChronologyComponent >> columnHeadings [
	^ {'Fecha' . 'Lote'. 'Tipo de evento' . 'Resumen'}
]

{ #category : #rendering }
EventsChronologyComponent >> columnValuesFor: element [
	^ {(element date ddmmyyyy , ' - ' , element time print24WithoutSeconds ).
	element plot id.
	(self typeDescriptorFor: element).
	(element summaryFor: self)}
]

{ #category : #accessing }
EventsChronologyComponent >> elements [
	| events |
	events := plot
		ifNotNil: [ plot events ]
		ifNil: [ self session farm
				ifNotNil: [ :farm | farm events ]
				ifNil: [ Array new ] ].
	^ events
		asSortedCollection: [ :a :b | a dateAndTime > b dateAndTime ]
]

{ #category : #initialization }
EventsChronologyComponent >> initialize [
	super initialize.
	addEnabled := false.
	editEnabled := false.
	duplicateEnabled := false.
	removeEnabled := false.
]

{ #category : #accessing }
EventsChronologyComponent >> plot [
	^ plot
]

{ #category : #accessing }
EventsChronologyComponent >> plot: anObject [
	plot := anObject
]

{ #category : #rendering }
EventsChronologyComponent >> renderPlotFilterOn: html [
	html
		form: [ html
				row: [ html
						column: [ html select
								formControl;
								selected: plot;
								callback: [ :value | 
									plot := value.
									paginator := Paginator
										subject: self
										selector: #elements
										pageSize: 10 ];
								id: 'plot';
								list: {nil} , self session farm plots ]
							mediumSize: 3;
						column: [ html submitButton
								class: 'btn btn-primary';
								with: 'Filtrar' ]
							mediumSize: 6 ] ]
]

{ #category : #rendering }
EventsChronologyComponent >> renderPlotSelectorOn: html [
	"This is horrible! "

	html
		navigation: [ self session farm plots
				do: [ :each | 
					html navigationLink
						beDisabledIf: [ plot = each ];
						callback: [ plot := each. ];
						with: each printString ] ]
]

{ #category : #summaries }
EventsChronologyComponent >> summaryForAdversityReport: anAdversityReport [
	^ anAdversityReport adversityTypes asCommaString , ' ('
		, anAdversityReport descriptionOfAdversities , ')'
]

{ #category : #summaries }
EventsChronologyComponent >> summaryForApplication: anApplication [
	^ anApplication substance comercialName , ': '
		, anApplication quantity printString
]

{ #category : #summaries }
EventsChronologyComponent >> summaryForCropSale: aCropSale [
	^ aCropSale sale client , ': ' , aCropSale crop vulgarName , ' ('
		, aCropSale kilograms asString , ' Kg)'
]

{ #category : #summaries }
EventsChronologyComponent >> summaryForHarvesting: aHarvesting [
	| stream |
	stream := String new writeStream.
	stream
		nextPutAll: aHarvesting crop vulgarName;
		nextPutAll: ' - ';
		nextPutAll: aHarvesting quantity printString;
		nextPutAll: ' Kg'.
	aHarvesting otherUnit
		ifNotNil: [ :it | 
			stream
				nextPutAll: ' / ';
				nextPutAll: it printString ].
	^ stream contents
]

{ #category : #summaries }
EventsChronologyComponent >> summaryForSowing: aSowing [
	| stream |
	stream := String new writeStream.
	stream nextPutAll: aSowing crop vulgarName.
	aSowing cultivarName
		ifNotEmpty: [ :it | 
			stream
				nextPutAll: ' (';
				nextPutAll: it;
				nextPutAll: ')' ].
	stream nextPutAll: ' - '.
	stream nextPutAll: aSowing quantity printString.
	^ stream contents
]

{ #category : #rendering }
EventsChronologyComponent >> typeDescriptorFor: element [
	^ {(Application -> 'Aplicación').
	(CropSale -> 'Venta').
	(Harvesting -> 'Cosecha').
	(AdversityReport -> 'Adversidad').
	(Sowing -> 'Siembra')} asDictionary at: element class
]
