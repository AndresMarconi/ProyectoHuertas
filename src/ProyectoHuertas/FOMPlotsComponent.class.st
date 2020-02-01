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

{ #category : #adding }
FOMPlotsComponent >> addEvent: editor [
	| event |
	event  := (self call: (editor)).
	event ifNotNil: [ :it | 
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

{ #category : #callbacks }
FOMPlotsComponent >> editEvent: editor [ 
	(self call: (editor))
		ifNotNil: [ :it | it save. self plot save ]
]

{ #category : #accessing }
FOMPlotsComponent >> elements [
	^ plot ifNil: [ Array new ] ifNotNil: [ plot events ]
]

{ #category : #'t-rotating' }
FOMPlotsComponent >> heading [
	^ 'Eventos del ' , plot printString
]

{ #category : #callbacks }
FOMPlotsComponent >> listElement: event On: html [
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
				with: 'Registrar Aplicacion' ]
]

{ #category : #hooks }
FOMPlotsComponent >> renderContentOn: html [
	self renderPlotSelectorOn: html.
	plot ifNil: [ ^ self ].
	self renderAsTableOn: html.
	self renderButtonsOn: html
]

{ #category : #renderning }
FOMPlotsComponent >> renderPlotSelectorOn: html [
	"This is horrible! "

	html
		navigation: [ self session plots
				do: [ :each | 
					html navigationLink
						beDisabledIf: [ plot = each ];
						callback: [ plot := each ];
						with: each printString ].
			html navigationLink
				callback: [ self addPlot ];
				with: 'Agregar lote' ]
]

{ #category : #rendering }
FOMPlotsComponent >> renderTableOn: html usingStyle: aStyle [
	html table
		class: aStyle;
		with: [ html
				tableHead: [ html
						tableRow: [ html tableHeading: 'Fecha'.
							html tableHeading: 'Descripcion'.
							html tableHeading: 'Opciones' ] ].
			html
				tableBody: [ (paginator showElementsOf: self elements)
						do: [ :element | 
							html
								tableRow: [ html tableData: element date asDate ddmmyyyy.
									html tableData: element rowText.
									html
										tableData: [ html
												form: [ html formButton
														bePrimary;
														callback: [ self editEvent: element editor ];
														with: [ html span class: 'fa fa-pencil' ].
													html space.
													html formButton
														beDanger;
														callback: [ self removeElement: element ];
														with: [ html span class: 'fa fa-trash' ] ] ] ] ] ] ]
]
