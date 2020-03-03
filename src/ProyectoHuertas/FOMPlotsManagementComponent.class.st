Class {
	#name : #FOMPlotsManagementComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMPlotsManagementComponent >> addElement [
	| farm newPlot |
	farm := self session farm.
	newPlot := self call: (self elementEditorClass subject: Plot new).
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

{ #category : #hooks }
FOMPlotsManagementComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Plot
]

{ #category : #hooks }
FOMPlotsManagementComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ PlotEditor
]

{ #category : #accessing }
FOMPlotsManagementComponent >> elements [
	^ self session plots
]
