Class {
	#name : #FOMPlotsComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMPlotsComponent class >> plot: aPlot [
	| component |
	component:= self new.
	component
		plot: aPlot;
		paginator: (Paginator newTotalElements: component elements perPage: 10).
	^ component
]

{ #category : #callbacks }
FOMPlotsComponent >> addEvent: event [
	| editedEvent |
	editedEvent := self call: event editor.
	editedEvent
		ifNotNil: [ :it | 
			it save.
			plot addEvent: it.
			plot save ]
]

{ #category : #callbacks }
FOMPlotsComponent >> addPlot [
	| farm newPlot |
	farm := self session farm.
	newPlot := self call: (PlotEditor subject: Plot new).
	newPlot
		ifNotNil: [ :it | 
			it save.
			farm
				ifNotNil: [ farm addPlot: it.
					farm save ].
			plot := newPlot ]
]

{ #category : #rendering }
FOMPlotsComponent >> columnHeadings [
	^ {'Fecha' . 'Tipo de evento' . 'Resumen'}
]

{ #category : #rendering }
FOMPlotsComponent >> columnValuesFor: element [
	^ {element date asDate ddmmyyyy.
	(self typeDescriptorFor: element).
	(element summaryFor: self)}
]

{ #category : #callbacks }
FOMPlotsComponent >> editElement: element [
	(self call: element editor)
		ifNotNil: [ :it | 
			it save.
			self plot save ]
]

{ #category : #accessing }
FOMPlotsComponent >> elements [
	^ plot ifNil: [ Array new ] ifNotNil: [ plot events ]
]

{ #category : #accessing }
FOMPlotsComponent >> plot [
	^ plot
]

{ #category : #accessing }
FOMPlotsComponent >> plot: anObject [
	plot := anObject
]

{ #category : #printing }
FOMPlotsComponent >> printOn: aStream [
	aStream nextPutAll: 'Lotes'
]

{ #category : #rendering }
FOMPlotsComponent >> renderButtonsOn: html [
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
FOMPlotsComponent >> renderContentOn: html [
	self renderPlotSelectorOn: html.
	plot ifNil: [ ^ self ].
	self renderPlotDetailOn: html.
	html heading
		level4;
		with: 'Eventos'.
	super renderContentOn: html.
	html break.
	self renderButtonsOn: html
]

{ #category : #rendering }
FOMPlotsComponent >> renderPlotDetailOn: html [
	html heading
		level4;
		with: 'Detalles'.
	html
		paragraph: 'Aca ponemos un resumen de los datos y boton para editarlos'
]

{ #category : #rendering }
FOMPlotsComponent >> renderPlotSelectorOn: html [
	"This is horrible! "

	html
		navigation: [ self session plots
				do: [ :each | 
					html navigationLink
						beDisabledIf: [ plot = each ];
						callback: [ plot := each. self session selectPlot: each ];
						with: each printString ].
			html navigationLink
				callback: [ self addPlot ];
				with: 'Agregar lote' ]
]

{ #category : #summaries }
FOMPlotsComponent >> summaryForApplication: anApplication [
	^ anApplication substance comercialName , ' ('
		, anApplication dose , ' sobre '
		, anApplication surface printString , 'm2)'
]

{ #category : #summaries }
FOMPlotsComponent >> summaryForHarvesting: aHarvesting [
	^ aHarvesting quantity printString , 'Kg de '
		, aHarvesting variety vulgarName
]

{ #category : #summaries }
FOMPlotsComponent >> summaryForProblem: aProblem [
	^ aProblem name
]

{ #category : #summaries }
FOMPlotsComponent >> summaryForSowing: aSowing [
	^ aSowing variety vulgarName , ' (' , aSowing quantity printString
		, '/' , aSowing distribution , '/' , aSowing conductionSystem , ')'
]

{ #category : #rendering }
FOMPlotsComponent >> typeDescriptorFor: element [
	^ element class typeDescriptor
]
