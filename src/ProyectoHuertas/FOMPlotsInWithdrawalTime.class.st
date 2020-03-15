Class {
	#name : #FOMPlotsInWithdrawalTime,
	#superclass : #FOMAbstractListForDashboardComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMPlotsInWithdrawalTime >> columnHeadings [
	^  {'Lote'. 'Cultivo'. 'Producto'. 'Fin de carencia'}
]

{ #category : #rendering }
FOMPlotsInWithdrawalTime >> columnValuesFor: element [

	^ {element id.
		(element currentCycle sowing) crop vulgarName.
		((element currentCycle aplications) last) substance comercialName.
		element currentCycle inWaitingPeriod ddmmyyyy}
]

{ #category : #accessing }
FOMPlotsInWithdrawalTime >> elements [
	^ (self session plots reject: [ :plot | ((plot currentCycle) inWaitingPeriod) isNil ])
		asSortedCollection: [ :a :b | a date < b date ].
]

{ #category : #rendering }
FOMPlotsInWithdrawalTime >> renderContentOn: html [
	html heading level3; with: 'Lotes en carencia'.
	html paragraph: 'Respete las carencias correspondientes a los fitosanitarios aplicados.'.
	super renderContentOn: html.
]
