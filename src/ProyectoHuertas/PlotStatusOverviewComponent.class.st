Class {
	#name : #PlotStatusOverviewComponent,
	#superclass : #GAFAbstractTableWithFilterAndActionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #summaries }
PlotStatusOverviewComponent >> adversitySummaryForPlot: aPlot [
	^ String
		streamContents: [ :stream | 
			aPlot currentCycle latestAdversity
				ifNotNil: [ :it | 
					stream
						nextPutAll: 'Se <b>reportó ';
						nextPutAll: it descriptionOfAdversities;
						nextPutAll: '</b> hace ';
						nextPutAll: (Date today - it date) asDays truncated printString;
						nextPutAll: ' días (el ';
						nextPutAll: it date ddmmyyyy;
						nextPutAll: '). ' ] ]
]

{ #category : #summaries }
PlotStatusOverviewComponent >> applicationsSummaryForPlot: aPlot [
	^ String
		streamContents: [ :stream | 
			aPlot isInWithdrawal
				ifTrue: [ stream
						nextPutAll: '<span style="color:red">En carencia hasta el ';
						nextPutAll: aPlot endsOfWithdrawalPeriods max ddmmyyyy;
						nextPutAll: '. </span>' ] ]
]

{ #category : #rendering }
PlotStatusOverviewComponent >> columnHeadings [
	^ {'Lote' . 'Implantación' . 'Adversidades'}
]

{ #category : #rendering }
PlotStatusOverviewComponent >> columnValuesFor: element [
	"{'Lote' . 'Implantación' . 'Adversidades' . 'Aplicaciones'.
	'Cosecha'}"

	^ {element id.
	(self sowingSummaryForPlot: element).
	(self adversitySummaryForPlot: element)}
]

{ #category : #accessing }
PlotStatusOverviewComponent >> elements [
	^ self session farm plots
]

{ #category : #summaries }
PlotStatusOverviewComponent >> harvestingSummaryForPlot: aPlot [
	^ String
		streamContents: [ :stream | 
			aPlot currentCycle latestHarvest
				ifNotNil: [ :it | 
					stream
						nextPutAll: 'Se comenzó a <b>cosechar ';
						nextPutAll: it crop vulgarName;
						nextPutAll: '</b> hace ';
						nextPutAll: (Date today - it date) asDays truncated printString;
						nextPutAll: ' días (el ';
						nextPutAll: it date ddmmyyyy;
						nextPutAll: '). ' ] ]
]

{ #category : #initialization }
PlotStatusOverviewComponent >> initialize [
	super initialize.
	addEnabled := false.
	editEnabled := false.
	duplicateEnabled := false
]

{ #category : #summaries }
PlotStatusOverviewComponent >> sowingSummaryForPlot: aPlot [
	^ String
		streamContents: [ :stream | 
			aPlot currentCycle latestSowing
				ifNotNil: [ :it | 
					stream
						nextPutAll: 'Se <b>sembró ';
						nextPutAll: it crop vulgarName;
						nextPutAll: '</b> hace ';
						nextPutAll: (Date today - it date) asDays truncated printString;
						nextPutAll: ' días (el ';
						nextPutAll: it date ddmmyyyy;
						nextPutAll: '). ' ] ]
]
