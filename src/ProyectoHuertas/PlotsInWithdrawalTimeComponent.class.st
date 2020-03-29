Class {
	#name : #PlotsInWithdrawalTimeComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
PlotsInWithdrawalTimeComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo'. 'Producto'. 'Fin de carencia'}
]

{ #category : #rendering }
PlotsInWithdrawalTimeComponent >> columnValuesFor: element [

	^ {element id.
		(element currentCycle sowing) crop vulgarName.
		((element currentCycle aplications) last) substance comercialName.
		element currentCycle inWaitingPeriod ddmmyyyy}
]

{ #category : #accessing }
PlotsInWithdrawalTimeComponent >> elements [
	^ (self session farm plots reject: [ :plot | ((plot currentCycle) inWaitingPeriod) isNil ])
		asSortedCollection: [ :a :b | (a currentCycle inWaitingPeriod) < (b currentCycle inWaitingPeriod) ].
]

{ #category : #accessing }
PlotsInWithdrawalTimeComponent >> parent [
	^ parent
]

{ #category : #rendering }
PlotsInWithdrawalTimeComponent >> renderContentOn: html [
	paginator elementsPerPage: 5.
	super renderContentOn: html
]
