Class {
	#name : #YeildReportsComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
YeildReportsComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Cosechado' . 'Esperado'.  'Restan'}
]

{ #category : #rendering }
YeildReportsComponent >> columnValuesFor: element [

	^ {element id.
		element currentCrop vulgarName.
		element currentCycle harvested.
		element currentCycle sowing expectedYield.
		(element currentCycle daysToEndOfHarvest asString), ' dias'}
]

{ #category : #accessing }
YeildReportsComponent >> elements [
	^ self session farm plotsWithSowing
		select: [ :plot | 
			(Date today isBefore: plot currentCycle endOfPeriod)
				and: [ Date today isAfter: plot currentCycle harvestDate ] ]
]

{ #category : #accessing }
YeildReportsComponent >> parent [
	^ parent
]

{ #category : #rendering }
YeildReportsComponent >> renderContentOn: html [
	paginator elementsPerPage: 5.
	super renderContentOn: html
]
