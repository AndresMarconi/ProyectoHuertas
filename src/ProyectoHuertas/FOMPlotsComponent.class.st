Class {
	#name : #FOMPlotsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

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
				cardBody: [ html cardTitle level5 with: 'Identificador del lote'.
					html
						cardText: [ html
								text: 'Variedad: algo.';
								break;
								text: 'Ultimo evento: resumen del último evento.';
								break;
								text: '....' ].
					html formButton bePrimary with: 'Detalles' ] ]
]

{ #category : #rendering }
FOMPlotsComponent >> renderContentOn: html [
	html
		row: [ self session plots do: [ :plot | self render: plot on: html ] ]
]
