Class {
	#name : #FOMEventsChronologyComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMEventsChronologyComponent class >> plot: aPlot [
	| component |
	component:= self new.
	component
		plot: aPlot;
		loadPaginator.
	^ component
]

{ #category : #rendering }
FOMEventsChronologyComponent >> columnHeadings [
	^ {'Fecha' . 'Lote'. 'Tipo de evento' . 'Resumen'}
]

{ #category : #rendering }
FOMEventsChronologyComponent >> columnValuesFor: element [
	^ {(element date asDate ddmmyyyy , ' - ' , element time).
	element plot id.
	(self typeDescriptorFor: element).
	(element summaryFor: self)}
]

{ #category : #accessing }
FOMEventsChronologyComponent >> elements [
	| events |
	events := plot
		ifNotNil: [ plot events ]
		ifNil: [ self session farm
				ifNotNil: [ :farm | farm events ]
				ifNil: [ Array new ] ].
	^ events asSortedCollection: [ :a :b |  (DateAndTime date: a date time: a time asTime) > (DateAndTime date: b date time: b time asTime)  ]
]

{ #category : #initialization }
FOMEventsChronologyComponent >> initialize [
	super initialize.
	addEnabled := false.
	editEnabled := false
]

{ #category : #accessing }
FOMEventsChronologyComponent >> plot [
	^ plot
]

{ #category : #accessing }
FOMEventsChronologyComponent >> plot: anObject [
	plot := anObject
]

{ #category : #rendering }
FOMEventsChronologyComponent >> renderContentOn: html [
	html heading
		level4;
		with: 'Eventos'.
	self renderPlotFilterOn: html.
	html break.
	super renderContentOn: html.
]

{ #category : #rendering }
FOMEventsChronologyComponent >> renderPlotFilterOn: html [
	html form: [
		html row:[ 
			html column: [
				html select
					formControl;
					selected: plot;
       			callback: [ :value | plot:= value. 
						paginator:= Paginator newTotalElements: (self elements size) perPage: 10 ];
					id: 'plot';
					list: {nil}, self session plots. ] mediumSize: 3;
			column:[  
		html submitButton class: 'btn btn-primary'; with: 'Filtrar' ] mediumSize: 6 ] ] 
]

{ #category : #rendering }
FOMEventsChronologyComponent >> renderPlotSelectorOn: html [
	"This is horrible! "

	html
		navigation: [ self session plots
				do: [ :each | 
					html navigationLink
						beDisabledIf: [ plot = each ];
						callback: [ plot := each.
							self session selectPlot: each ];
						with: each printString ] ]
]

{ #category : #summaries }
FOMEventsChronologyComponent >> summaryForApplication: anApplication [
	^ anApplication substance comercialName , ': ' , anApplication dose
		, ' (' , anApplication reason , ')'
]

{ #category : #summaries }
FOMEventsChronologyComponent >> summaryForHarvesting: aHarvesting [
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
FOMEventsChronologyComponent >> summaryForProblem: aProblem [
	^ aProblem name , ' (' , aProblem type , ')'
]

{ #category : #summaries }
FOMEventsChronologyComponent >> summaryForSowing: aSowing [
	| stream |
	stream := String new writeStream.
	stream nextPutAll: aSowing crop vulgarName.
	aSowing cultivarName
		ifNotNil: [ :it | 
			stream
				nextPutAll: ' (';
				nextPutAll: it;
				nextPutAll: ')' ].
	stream nextPutAll: ' - '.
	stream nextPutAll: aSowing quantity printString.
	^stream contents
]

{ #category : #rendering }
FOMEventsChronologyComponent >> typeDescriptorFor: element [
	^ element class typeDescriptor
]
