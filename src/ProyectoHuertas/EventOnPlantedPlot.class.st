Class {
	#name : #EventOnPlantedPlot,
	#superclass : #Event,
	#category : #'ProyectoHuertas-model'
}

{ #category : #accessing }
EventOnPlantedPlot >> plot: aPlot [
	super plot: aPlot.
	crop := aPlot cropAtDateAndTime: dateAndTime
]
