Class {
	#name : #FOMPlotsManagementComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMPlotsManagementComponent >> addPlot [
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
FOMPlotsManagementComponent >> columnHeadings [
	^ {'ID' . 'Superficie (m2)' }
]

{ #category : #rendering }
FOMPlotsManagementComponent >> columnValuesFor: element [
	^ {element id.
	element surface}
]

{ #category : #callbacks }
FOMPlotsManagementComponent >> editElement: element [
	(self call: (PlotEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMPlotsManagementComponent >> elements [
	^ self session plots
]

{ #category : #printing }
FOMPlotsManagementComponent >> printOn: aStream [
	aStream nextPutAll: 'Lotes'
]

{ #category : #rendering }
FOMPlotsManagementComponent >> renderContentOn: html [
	super renderContentOn: html.
	html anchor
		callback: [ self addPlot ];
		with: [ html formButton
				bePrimary;
				with: 'Agregar lote' ]
]
