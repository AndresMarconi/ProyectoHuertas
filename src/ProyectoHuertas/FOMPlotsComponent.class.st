Class {
	#name : #FOMPlotsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMPlotsComponent >> addPlot: farm [
	| plot |
	plot := self call: (PlotEditor subject: Plot newFom).
	plot ifNotNil: [ :it | 
		it save.
		farm ifNotNil: [ farm addPlot: it.
							  farm save ] ]
]

{ #category : #'as yet unclassified' }
FOMPlotsComponent >> detailsPlot: plot [
	(self call: (FOMPlotEventComponent plot: plot))
]

{ #category : #callbacks }
FOMPlotsComponent >> editPlot: plot [
	(self call: (PlotEditor subject: plot))
		ifNotNil: [ :it | it save ]
]

{ #category : #printing }
FOMPlotsComponent >> printOn: aStream [
	aStream nextPutAll: 'Lotes'
]

{ #category : #removing }
FOMPlotsComponent >> removePlot: plot [
	plot delete
]

{ #category : #rendering }
FOMPlotsComponent >> render: plot on: html [
	html card
		style: 'width: 18rem;';
		class: 'm-1';
		with: [ html
				cardBody: [ html cardTitle level5 with: [ 
						html anchor
							callback: [ self editPlot: plot  ];
							with: [ html text: 'Lote N°'. html text: plot id ] ].
					html
						cardText: [ html
								text: plot lastSowing ;
								break;
								text: plot lastEvent ].
					html form: [
						html formButton bePrimary;
							callback: [ self detailsPlot: plot ];
							with: 'Datalles'.
						html space.
						html formButton
							beDanger;
							callback: [ self removePlot: plot ];
							with: 'Eliminar' ] ] ]
]

{ #category : #rendering }
FOMPlotsComponent >> renderContentOn: html [
	html
		row: [ self session plots do: [ :plot | self render: plot on: html ] ];
		break.
	html anchor
		callback: [ self addPlot: (self session farm) ];
		with: [ html formButton bePrimary;
						with: 'Agregar lote' ]
			
]
