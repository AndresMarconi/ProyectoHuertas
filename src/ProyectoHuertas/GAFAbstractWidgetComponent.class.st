Class {
	#name : #GAFAbstractWidgetComponent,
	#superclass : #GAFAbstractTableComponent,
	#instVars : [
		'rows'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #accessing }
GAFAbstractWidgetComponent class >> rows: aRowQuantity [
	^ self new
		rows: aRowQuantity;
		yourself
]

{ #category : #accessing }
GAFAbstractWidgetComponent class >> rows: aRowQuantity parent: aParent [
	^ self new
		rows: aRowQuantity;
		parent: aParent;
		yourself
]

{ #category : #rendering }
GAFAbstractWidgetComponent >> renderButtonShowAllOn: html [
	(self elements size > rows)
		ifTrue: [ html
				paragraph 
					class: 'd-flex flex-row-reverse';
					with: [ html anchor
					   id: 'view-All-button';
						callback: [ self viewAll ];
						with: [ html formButton
								bePrimary;
								with: 'Ver todos' ] ] ]
]

{ #category : #rendering }
GAFAbstractWidgetComponent >> renderContentOn: html [
	paginator elementsPerPage: rows.
	self renderElementsTableOn: html.
	self renderButtonShowAllOn: html
]

{ #category : #accessing }
GAFAbstractWidgetComponent >> rows [
	^ rows
]

{ #category : #accessing }
GAFAbstractWidgetComponent >> rows: anObject [
	rows := anObject
]

{ #category : #'as yet unclassified' }
GAFAbstractWidgetComponent >> viewAll [
	^ self subclassResponsibility 
]
