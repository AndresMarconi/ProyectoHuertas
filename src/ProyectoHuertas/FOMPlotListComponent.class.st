Class {
	#name : #FOMPlotListComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMPlotListComponent >> render: plot on: html [
	html paragraph: plot id
]

{ #category : #rendering }
FOMPlotListComponent >> renderContentOn: html [
	html heading
		level: 1;
		with: 'Lotes'.
	self session farm plots do: [ :plot | self render: plot on: html ].
	
]
