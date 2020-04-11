Class {
	#name : #NextToHarvestComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
NextToHarvestComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Dias restantes'. 'Duracion(dias)'}
]

{ #category : #rendering }
NextToHarvestComponent >> columnValuesFor: element [

	^ {element id.
		element currentCrop vulgarName.
		element currentCycle daysToHarvest.
		element currentCycle harvestDuration}
]

{ #category : #accessing }
NextToHarvestComponent >> elements [
	^ (self session farm plotsWithSowing
		select: [ :plot | plot currentCycle harvestDate isAfter: Date today ])
		reject: [ :plot | self plotsInWaitingPeriod includes: plot ]
]

{ #category : #accessing }
NextToHarvestComponent >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
NextToHarvestComponent >> plotsInWaitingPeriod [
	^(self session farm plots reject: [ :plot | ((plot currentCycle) inWaitingPeriod) isNil ])
]

{ #category : #rendering }
NextToHarvestComponent >> renderContentOn: html [
	paginator elementsPerPage: 5.
	super renderContentOn: html.
]
