Class {
	#name : #FOMPlotsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMPlotsComponent >> addPlot: farm [
	| plot |
	plot := self call: (PlotEditor subject: Plot new).
	plot ifNotNil: [ :it | 
		it save.
		farm ifNotNil: [ farm addPlot: it.
							  farm save ] ]
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
								text: 'Variedad: algo.';
								break;
								text: 'Ultimo evento: resumen del último evento.';
								break;
								text: '....' ].
					html formButton bePrimary with: 'Detalles'.
					html space.
					html formButton bePrimary 
						callback: [ self editPlot: plot  ];
						with: 'Editar'. ] ]
]

{ #category : #rendering }
FOMPlotsComponent >> renderContentOn: html [
	html
		row: [ self session plots do: [ :plot | self render: plot on: html ] ];
		row: [ html anchor
					callback: [ self addPlot: (self session farm) ];
					with: [ html formButton bePrimary;
								with: 'Agregar lote' ] ]
]
