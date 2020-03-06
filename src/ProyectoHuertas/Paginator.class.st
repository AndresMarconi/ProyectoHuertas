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
Paginator >> renderItem: simbol Number: aNumber Active: boolean on: html [
	html listItem
		class: (boolean ifTrue: [ 'page-item active' ] ifFalse: [ 'page-item' ] );
		with: [ html anchor
			class: 'page-link';
			callback: [ page := aNumber ];
			with: simbol ]
]

{ #category : #rendering }
Paginator >> renderNextButtonOn: html [
	(page = self pages)
	ifTrue: [ 
		html listItem class:'page-item disabled'; with: [ 
			html anchor class:'page-link';
			callback: [ self page: (page + 1) ];
			with:'siguiente'  ] ] 
	ifFalse: [ 
		html listItem class:'page-item'; with: [ 
			html anchor class:'page-link';
			callback: [ self page: (page + 1) ];
			with:'siguiente'  ] ] 
]

{ #category : #rendering }
Paginator >> renderPagesOn: html [
	(self pages < 10)
	ifTrue: [ 
		1 to: self pages do: [ :pageNumber | 
		page = pageNumber
			ifTrue: [ self renderItem: pageNumber Number: pageNumber Active: true on: html ]
			ifFalse: [ self renderItem: pageNumber Number: pageNumber Active: false on: html] ] ] 
	ifFalse: [ 
		self leftItemsQuantity to: (self rigthItemsQuantity) do: [ :pageNumber | 
		page = pageNumber
			ifTrue: [ self renderItem: pageNumber Number: pageNumber Active: true on: html ]
			ifFalse: [ self renderItem: pageNumber Number: pageNumber Active: false on: html ] ] ] 
	
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
		html listItem class:'page-item disabled'; with: [ 
			html anchor class:'page-link';
			callback: [ self page: (page - 1) ];
			with:'anterior' ] ]
	ifFalse: [ 
		html listItem class:'page-item'; with: [ 
			html anchor class:'page-link';
			callback: [ self page: (page - 1) ];
			with:'anterior' ] ] 
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
