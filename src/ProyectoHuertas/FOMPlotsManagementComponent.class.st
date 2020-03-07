Class {
	#name : #FOMPlotsManagementComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

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

{ #category : #callbacks }
FOMPlotsManagementComponent >> saveAddedElement: aPlot [
	super saveAddedElement: aPlot.
	self session farm addPlot: aPlot.
	self session farm save
]
