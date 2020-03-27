Class {
	#name : #PlotsInWithdrawalTime,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
PlotsInWithdrawalTime >> columnHeadings [
	^  {'Lote'. 'Cultivo'. 'Producto'. 'Fin de carencia'}
]

{ #category : #rendering }
PlotsInWithdrawalTime >> columnValuesFor: element [

	^ {element id.
		(element currentCycle sowing) crop vulgarName.
		((element currentCycle aplications) last) substance comercialName.
		element currentCycle inWaitingPeriod ddmmyyyy}
]

{ #category : #accessing }
PlotsInWithdrawalTime >> elements [
	^ (self session farm plots reject: [ :plot | ((plot currentCycle) inWaitingPeriod) isNil ])
		asSortedCollection: [ :a :b | (a currentCycle inWaitingPeriod) < (b currentCycle inWaitingPeriod) ].
]

{ #category : #accessing }
PlotsInWithdrawalTime >> parent [
	^ parent
]

{ #category : #rendering }
PlotsInWithdrawalTime >> renderContentOn: html [
	html heading level3; with: 'Lotes en carencia'.
	html paragraph: 'Respete las carencias correspondientes a los fitosanitarios aplicados.'.
	paginator elementsPerPage: 5.
	super renderContentOn: html.
]
