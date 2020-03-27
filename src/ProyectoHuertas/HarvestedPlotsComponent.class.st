Class {
	#name : #HarvestedPlotsComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
HarvestedPlotsComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Cosechado' . 'Esperado'. 'Optimo'. 'Fecha de fin'}
]

{ #category : #rendering }
HarvestedPlotsComponent >> columnValuesFor: element [

	^ {element id.
		element currentCrop vulgarName.
		element harvested.
		element currentCycle sowing expectedYield.
		element currentCrop optimalYieldPerPlant.
		element currentCycle endOfPeriod}
]

{ #category : #accessing }
HarvestedPlotsComponent >> elements [
	^ (self session farm plots select: [ :plot | 
		(plot currentCycle endOfPeriod isBefore: Date today)
		and: [ plot currentCycle harvestDate isAfter: Date today ] ] ).
]

{ #category : #accessing }
HarvestedPlotsComponent >> parent [
	^ parent
]

{ #category : #rendering }
HarvestedPlotsComponent >> renderContentOn: html [
	html heading level3; with: 'Lotes en periodo de cosecha'.
	html paragraph: 'Se muestran los resultados de su cosecha hasta ahora.'.
	paginator elementsPerPage: 5.
	super renderContentOn: html.
]
