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
		paginator: (Paginator newTotalElements: component elements perPage: 10).
	^ component
]

{ #category : #rendering }
FOMEventsChronologyComponent >> columnHeadings [
	^ {'Fecha' . 'Tipo de evento' . 'Resumen'}
]

{ #category : #rendering }
FOMEventsChronologyComponent >> columnValuesFor: element [
	^ {element date asDate ddmmyyyy.
	(self typeDescriptorFor: element).
	(element summaryFor: self)}
]

{ #category : #accessing }
FOMEventsChronologyComponent >> elements [
	^ plot
		ifNotNil: [ plot events ]
		ifNil: [ self session farm
				ifNotNil: [ :farm | farm events ]
				ifNil: [ Array new ] ]
]

{ #category : #accessing }
FOMEventsChronologyComponent >> plot [
	^ plot
]

{ #category : #accessing }
FOMEventsChronologyComponent >> plot: anObject [
	plot := anObject
]

{ #category : #printing }
FOMEventsChronologyComponent >> printOn: aStream [
	aStream nextPutAll: 'Cronología'
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
						paginator:= Paginator newTotalElements: self elements perPage: 10 ];
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
	^ anApplication substance comercialName , ' ('
		, anApplication dose , ' sobre '
		, anApplication surface printString , 'm2)'
]

{ #category : #summaries }
FOMEventsChronologyComponent >> summaryForHarvesting: aHarvesting [
	^  aHarvesting otherUnit, ' de '
		, aHarvesting variety vulgarName
]

{ #category : #summaries }
FOMEventsChronologyComponent >> summaryForProblem: aProblem [
	^ aProblem name
]

{ #category : #summaries }
FOMEventsChronologyComponent >> summaryForSowing: aSowing [
	^ aSowing variety vulgarName , ' (' , aSowing quantity printString, ')'
]

{ #category : #rendering }
FOMEventsChronologyComponent >> typeDescriptorFor: element [
	^ element class typeDescriptor
]
