Class {
	#name : #Paginator,
	#superclass : #Object,
	#instVars : [
		'page',
		'totalElements',
		'elements'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #'instance creation' }
Paginator class >> newTotalElements: total perPage: quantity [
	| paginate |
	paginate := self new.
	paginate totalElements: total.
	paginate elements: quantity.
	^ paginate 
]

{ #category : #accessing }
Paginator >> elements [
	^ elements
]

{ #category : #accessing }
Paginator >> elements: anObject [
	elements := anObject
]

{ #category : #initialization }
Paginator >> initialize [ 
	page := 1
]

{ #category : #'as yet unclassified' }
Paginator >> leftItemsQuantity [
	| first last|
	first:= page - 5.
	last:= page + 5.
	first < 1 ifTrue: [ first:= 1 ] 
	ifFalse: [ last > self pages ifTrue: [ first:= first - (last - self pages) ] ].
	^ first
	
]

{ #category : #accessing }
Paginator >> page [
	^ page
]

{ #category : #accessing }
Paginator >> page: number [
	((number > 0) and: (number <= (self pages)))  
		ifTrue: [ page := number ]
	
]

{ #category : #accessing }
Paginator >> pages [ 
	^ (totalElements quo: elements) + 1 
]

{ #category : #rendering }
Paginator >> renderItem: simbol Number: aNumber Class: aClass on: html [
	html listItem
		class: 'page-item ',aClass ;
		with: [ html anchor
			class: 'page-link';
			callback: [ page := aNumber ];
			with: simbol ]
]

{ #category : #rendering }
Paginator >> renderNextButtonOn: html [
	(page = self pages)
	ifTrue: [ 
		self renderItem: '>' Number: (page) Class: ' disabled' on: html.
		self renderItem: '>>' Number: (page) Class: ' disabled' on: html. ] 
	ifFalse: [ 
		self renderItem: '>' Number: (page + 1) Class: '' on: html. 
		self renderItem: '>>' Number: (self pages) Class: '' on: html.  ] 
]

{ #category : #rendering }
Paginator >> renderPagesOn: html [
	(self pages < 10)
	ifTrue: [ 
		1 to: self pages do: [ :pageNumber | 
		page = pageNumber
			ifTrue: [ self renderItem: pageNumber Number: pageNumber Class: 'active' on: html ]
			ifFalse: [ self renderItem: pageNumber Number: pageNumber Class: '' on: html] ] ] 
	ifFalse: [ 
		self leftItemsQuantity to: (self rigthItemsQuantity) do: [ :pageNumber | 
		page = pageNumber
			ifTrue: [ self renderItem: pageNumber Number: pageNumber Class: 'active' on: html ]
			ifFalse: [ self renderItem: pageNumber Number: pageNumber Class: '' on: html ] ] ] 
	
]

{ #category : #rendering }
Paginator >> renderPaginationOn: html [
	totalElements < elements
		ifTrue: [ ^ self ].
	html
		navigation: [ html unorderedList
				class: 'pagination';
				with: [ self renderPreviousButtonOn: html.
					self renderPagesOn: html.
					self renderNextButtonOn: html ] ]
]

{ #category : #rendering }
Paginator >> renderPreviousButtonOn: html [
	(page = 1)
	ifTrue: [ 
		self renderItem: '<<' Number: (page) Class: ' disabled' on: html.
		self renderItem: '<' Number: (page) Class: ' disabled' on: html ]
	ifFalse: [
		self renderItem: '<<' Number: 1 Class: '' on: html. 
		self renderItem: '<' Number: (page - 1) Class: '' on: html ] 
]

{ #category : #'as yet unclassified' }
Paginator >> rigthItemsQuantity [
	| first last|
	first:= page - 5.
	last:= page + 5.
	last > self pages ifTrue: [ last:= self pages ] 
	ifFalse: [ first < 1 ifTrue: [ last:= last - first ] ].
	^ last
	
]

{ #category : #initialization }
Paginator >> selectElementsIn: collection [
	| total col |
	(elements < totalElements)
	ifTrue: [ 
		total := (totalElements - (elements * (page - 1))).
		col := collection last: total.
		(total > elements) 
		ifTrue: [ col := col first: elements ]. ]
	ifFalse: [ col:= collection ].
	^ col
]

{ #category : #accessing }
Paginator >> totalElements [
	^ totalElements
]

{ #category : #accessing }
Paginator >> totalElements: anObject [
	totalElements := anObject
]
