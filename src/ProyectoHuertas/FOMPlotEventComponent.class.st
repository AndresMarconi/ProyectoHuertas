Class {
	#name : #FOMPlotEventComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #accessing }
FOMPlotEventComponent class >> plot: aPlot [
	^ self new
		plot: aPlot;
		yourself
	
]

{ #category : #adding }
FOMPlotEventComponent >> addEvent: editor [
	| event |
	event  := self call: (editor).
	event ifNotNil: [ :it | 
		it save.
		plot addEvent: it.
		plot save ]
]

{ #category : #'as yet unclassified' }
FOMPlotEventComponent >> backToPlots [
	self answer: nil
]

{ #category : #'as yet unclassified' }
FOMPlotEventComponent >> editEvent: editor [ 
	(self call: (editor))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMPlotEventComponent >> elements [ 
	^ plot events
]

{ #category : #'t-rotating' }
FOMPlotEventComponent >> heading [
	^ 'Eventos del lote'
]

{ #category : #'as yet unclassified' }
FOMPlotEventComponent >> listElement: event On: html [
	| item |
	item:= html listGroupItem class: (event classRow). 
	item with: [ 
		html row class:'d-flex justify-content-between'; with: [ 
		html paragraph: [ html text: event rowText ].
		html form: [ 
			html formButton bePrimary;
				callback: [ self editEvent: (event editor) ];
				with: 'Modificar' ] ] ]. 
]

{ #category : #accessing }
FOMPlotEventComponent >> plot [
	^ plot
]

{ #category : #accessing }
FOMPlotEventComponent >> plot: anObject [
	plot := anObject
]

{ #category : #printing }
FOMPlotEventComponent >> printOn: aStream [
	aStream nextPutAll: 'Lote'
]

{ #category : #'as yet unclassified' }
FOMPlotEventComponent >> renderButtonsOn: html [
	html form: [ 
		html formButton bePrimary;
			callback: [ self addEvent: (SowingEditor subject: Sowing new) ];
			with: 'Agregar Siembra'.
		html space.
		html formButton bePrimary;
			callback: [ self addEvent: (HarvestingEditor subject: Harvesting new) ];
			with: 'Agregar Cosecha'.
		html space.
		html formButton bePrimary;
			callback: [ self addEvent: (AplicationEditor subject: Application new) ];
			with: 'Agregar Aplicacion'.
		html space.
		html formButton bePrimary;
			callback: [ self addEvent: (ProblemEditor subject: Problem new) ];
			with: 'Agregar Problema'.
		html space.
		html formButton beDanger;
			callback: [ self backToPlots ];
			with: 'volver' ]
]

{ #category : #hooks }
FOMPlotEventComponent >> renderContentOn: html [
	self listTempleteOn: html.
	self renderButtonsOn: html
]
