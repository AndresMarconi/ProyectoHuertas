Class {
	#name : #PlotStatusOverviewComponent,
	#superclass : #GAFAbstractTableWithFilterAndActionsComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
PlotStatusOverviewComponent >> columnHeadings [
	^ {'Lote' . 'Reporte'}
]

{ #category : #rendering }
PlotStatusOverviewComponent >> columnValuesFor: element [
	^ {element id.
	(self summaryForPlot: element)}
]

{ #category : #accessing }
PlotStatusOverviewComponent >> elements [
	^ self session farm plots
]

{ #category : #initialization }
PlotStatusOverviewComponent >> initialize [
	super initialize.
	addEnabled := false.
	editEnabled := false.
	duplicateEnabled := false
]

{ #category : #rendering }
PlotStatusOverviewComponent >> reportLatestHarvestIn: aPlot on: stream [
	aPlot currentCycle latestHarvest
		ifNotNil: [ :it | 
			stream
				nextPutAll: 'Se comenzó a <b>cosechar ';
				nextPutAll: it crop vulgarName;
				nextPutAll: '</b> hace ';
				nextPutAll: (Date today - it date) asDays truncated printString;
				nextPutAll: ' días (el ';
				nextPutAll: it date ddmmyyyy;
				nextPutAll: '). ' ]
]

{ #category : #rendering }
PlotStatusOverviewComponent >> reportLatestSowingIn: aPlot on: stream [
	aPlot currentCycle latestSowing
		ifNotNil: [ :it | 
			stream
				nextPutAll: 'Se <b>sembró ';
				nextPutAll: it crop vulgarName;
				nextPutAll: '</b> hace ';
				nextPutAll: (Date today - it date) asDays truncated printString;
				nextPutAll: ' días (el ';
				nextPutAll: it date ddmmyyyy;
				nextPutAll: '). ' ]
]

{ #category : #rendering }
PlotStatusOverviewComponent >> reportWithdrawalStatusOf: aPlot on: stream [
	aPlot isInWithdrawal
		ifTrue: [ stream
				nextPutAll: '<span style="color:red">En carencia hasta el ';
				nextPutAll: aPlot endsOfWithdrawalPeriods max ddmmyyyy;
				nextPutAll: '. </span>' ]
]

{ #category : #rendering }
PlotStatusOverviewComponent >> summaryForPlot: aPlot [
	^ String
		streamContents: [ :stream | 
			self reportLatestSowingIn: aPlot on: stream.
			self reportLatestHarvestIn: aPlot on: stream.
			self reportWithdrawalStatusOf: aPlot on: stream ]
]
