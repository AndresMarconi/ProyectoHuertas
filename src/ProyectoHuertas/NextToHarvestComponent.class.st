Class {
	#name : #NextToHarvestComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
NextToHarvestComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Fecha de inicio'. 'Duracion(dias)'}
]

{ #category : #rendering }
NextToHarvestComponent >> columnValuesFor: element [

	^ {element id.
		element currentCrop vulgarName.
		element currentCycle harvestDate yyyymmdd.
		element currentCycle endOfPeriod yyyymmdd}
]

{ #category : #accessing }
NextToHarvestComponent >> elements [
	^((self session farm plots) select: [ :plot| (plot currentCycle harvestDate) isAfter: (Date today)])
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
	html heading level3; with: 'Proximas Cosechas'.
	html paragraph: 'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.'.
	paginator elementsPerPage: 5.
	super renderContentOn: html.
]
