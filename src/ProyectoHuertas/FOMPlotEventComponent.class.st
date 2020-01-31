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
	| component |
	component:= self new.
	component
		plot: aPlot;
		paginator: (Paginator newTotalElements: component elements perPage: 10).
	^ component
]

{ #category : #adding }
FOMPlotEventComponent >> addEvent: editor [
	| event |
	event  := (self call: (editor)).
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
		ifNotNil: [ :it | it save. self plot save ]
]

{ #category : #accessing }
FOMPlotEventComponent >> elements [ 
	^ plot events
]

{ #category : #'t-rotating' }
FOMPlotEventComponent >> heading [
	^ 'Eventos del lote'
]

{ #category : #initialization }
FOMPlotEventComponent >> initialize [
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
	html
		form: [ html formButton
				bePrimary;
				callback: [ self addEvent: (SowingEditor subject: Sowing new) ];
				with: 'Registrar siembra'.
			html space.
			html formButton
				bePrimary;
				callback: [ self addEvent: (HarvestingEditor subject: Harvesting new) ];
				with: 'Registrar Cosecha'.
			html space.
			html formButton
				bePrimary;
				callback: [ self addEvent: (ProblemEditor subject: Problem new) ];
				with: 'Registrar Problema'.
			html space.
			html formButton
				bePrimary;
				callback: [ self addEvent: (AplicationEditor subject: Application new) ];
				with: 'Registrar Aplicacion'.
			html space.
			html formButton
				beDanger;
				callback: [ self backToPlots ];
				with: 'Volver' ]
]

{ #category : #hooks }
FOMPlotEventComponent >> renderContentOn: html [
	self tableTempleteOn: html.
	self renderButtonsOn: html
]

{ #category : #rendering }
FOMPlotEventComponent >> renderTableOn: html usingStyle: aStyle [
	html table
		class: aStyle;
		with: [ 
			html tableHead: [ 
				html tableRow: [ 	
					html tableHeading: 'Fecha'.	
					html tableHeading: 'Descripcion'.
					html tableHeading: 'Opciones' ] ].
			html tableBody: [ (paginator showElementsOf: (self elements)) do: [ :element | 
				html tableRow: 	[ 
					html tableData: element date asString.	
					html tableData: element rowText.
					html tableData: [ 
						html form: [ 
							html formButton bePrimary;
								callback: [ self editEvent: (element editor) ];
								with: 'Modificar'.
							html space.
							html formButton beDanger;
								callback: [ self removeElement: element ];
								with: 'Eliminar' ] ] ] ] ] ]
]
