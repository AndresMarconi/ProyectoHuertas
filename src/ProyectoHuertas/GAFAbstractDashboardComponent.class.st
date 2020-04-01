Class {
	#name : #GAFAbstractDashboardComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #initialization }
GAFAbstractDashboardComponent >> initialize [ 
	super initialize.
	self initializeComponents
]

{ #category : #initialization }
GAFAbstractDashboardComponent >> initializeComponents [ 
	^self subclassResponsibility.
]

{ #category : #rendering }
GAFAbstractDashboardComponent >> renderContentOn: html [
	html
		row: [ self sortedWigets
				do: [ :widget | 
					widget hasElementsToShow
						ifTrue: [ html column: [ html render: widget ] mediumSize: widget sizeOfColumn ] ] ]
]

{ #category : #'as yet unclassified' }
GAFAbstractDashboardComponent >> sortedWigets [
	^self widgets asSortedCollection: [ :a :b | a sizeOfColumn <= b sizeOfColumn ]
]

{ #category : #initialization }
GAFAbstractDashboardComponent >> widgets [ 
	^self subclassResponsibility.
]
