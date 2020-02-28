Class {
	#name : #FOMEventsChronologyComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot',
		'buffer'
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

{ #category : #callbacks }
FOMEventsChronologyComponent >> addEvent: event [
	| editedEvent |
	editedEvent := self call: event editor.
	editedEvent
		ifNotNil: [ :it | 
			it save.
			plot addEvent: it.
			plot save ]
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
	^ (plot) ifNil: [ self session farm events ] ifNotNil: [ plot events ]
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
FOMEventsChronologyComponent >> renderButtonsOn: html [
	html
		form: [ html formButton
				bePrimary;
				callback: [ self addEvent: Sowing new ];
				with: 'Registrar siembra'.
			html space.
			html formButton
				bePrimary;
				callback: [ self addEvent: Harvesting new ];
				with: 'Registrar Cosecha'.
			html space.
			html formButton
				bePrimary;
				callback: [ self addEvent: Problem new ];
				with: 'Registrar Problema'.
			html space.
			html formButton
				bePrimary;
				callback: [ self addEvent: Application new ];
				with: 'Registrar Aplicacion' ]
]

{ #category : #rendering }
FOMEventsChronologyComponent >> renderContentOn: html [
	self renderPlotFilterOn: html.
	html heading
		level4;
		with: 'Eventos'.
	super renderContentOn: html.
]

{ #category : #rendering }
FOMEventsChronologyComponent >> renderPlotDetailOn: html [
	html heading
		level4;
		with: 'Detalles'.
	html
		paragraph: 'Aca ponemos un resumen de los datos y boton para editarlos'
]

{ #category : #rendering }
FOMEventsChronologyComponent >> renderPlotFilterOn: html [
	html row: [ 
		html column: [ 
			html select
				formControl;
				list: {nil}, self session plots;
				selected: buffer;
				id: 'plot' ] mediumSize: 3;
			column: [ 
				html anchor
					callback: [ plot:= buffer ];
					with: [ 
						html formButton
						bePrimary;
						with: 'Filtrar' ]
				 ] mediumSize: 3
		 ] 
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
