Class {
	#name : #PlotsInWithdrawalTimeComponent,
	#superclass : #GAFAbstractWidgetComponent,
	#category : #'ProyectoHuertas-ui-farmer-dashboard'
}

{ #category : #rendering }
PlotsInWithdrawalTimeComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo'. 'Producto'. 'Restan'}
]

{ #category : #rendering }
PlotsInWithdrawalTimeComponent >> columnValuesFor: element [
	^ {element id.
	element currentCycle latestSowing crop vulgarName.
	element currentCycle aplications last substance comercialName.
	(element currentCycle withdrawalPeriodDaysLeft asString , ' dias')}
]

{ #category : #accessing }
PlotsInWithdrawalTimeComponent >> elements [
	^ (self session farm plotsWithSowing
		select: [ :each | each isInWithdrawal ])
		asSortedCollection:
			[ :a :b | a withdrawalPeriodDaysLeft < b withdrawalPeriodDaysLeft ]
]

{ #category : #accessing }
PlotsInWithdrawalTimeComponent >> parent [
	^ parent
]

{ #category : #'as yet unclassified' }
PlotsInWithdrawalTimeComponent >> viewAll [
]
