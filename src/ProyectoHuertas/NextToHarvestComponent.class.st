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

	^ {element plot id.
		element crop vulgarName.
		element harvestDate yyyymmdd.
		element harvestDuration}
]

{ #category : #accessing }
NextToHarvestComponent >> elements [
	| sowings |
	sowings:= (self session farm sowings) select: [ :each | (each harvestDate) isAfter: (Date today) ].
	^sowings reject: [ :each | self plotsInWaitingPeriod includes: each plot ]
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
