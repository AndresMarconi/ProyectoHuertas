Class {
	#name : #YeildReportsComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
YeildReportsComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Cosechado' . 'Esperado'. 'Optimo'. 'Fecha de fin'}
]

{ #category : #rendering }
YeildReportsComponent >> columnValuesFor: element [

	^ {element id.
		element currentCrop vulgarName.
		element currentCycle harvested.
		element currentCycle sowing expectedYield.
		element currentCrop optimalYieldPerPlant.
		element currentCycle endOfPeriod}
]

{ #category : #accessing }
YeildReportsComponent >> elements [
	^ (self session farm plots select: [ :plot | 
		(Date today isBefore: plot currentCycle endOfPeriod)
		and: [ plot currentCycle harvestDate isAfter: Date today ] ] ).
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
