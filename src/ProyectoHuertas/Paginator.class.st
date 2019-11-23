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
Paginator class >> newTotalElements: collection [
	| paginate |
	paginate := self new.
	paginate totalElements: (collection size).
	^ paginate 
]

{ #category : #'instance creation' }
Paginator class >> newTotalElements: collection perPage: quantity [
	| paginate |
	paginate := self new.
	paginate totalElements: (collection size).
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
Paginator >> nextButtonOn: html [
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
	^ totalElements quo: elements 
]

{ #category : #'as yet unclassified' }
Paginator >> pagesOn: html [
	1 to: (self pages) do: [ :pageNumber |
		(page = pageNumber)
		ifTrue: [ 
			html listItem class:'page-item active'; with: [ 
			html anchor 
			class:'page-link';
			callback: [ self page: pageNumber ];
			with: pageNumber ] ] 
		ifFalse: [ 
			html listItem class:'page-item'; with: [ 
			html anchor 
			class:'page-link';
			callback: [ self page: pageNumber ];
			with: pageNumber ] ] ]
		
]

{ #category : #'as yet unclassified' }
Paginator >> paginationOn: html [
	html navigation: [ 
		html unorderedList class:'pagination'; with: [ 
			self previousButtonOn: html.
			self pagesOn: html.
			self nextButtonOn: html ] ]
]

{ #category : #'as yet unclassified' }
Paginator >> previousButtonOn: html [
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
Paginator >> showElementsOf: collection [
	| total col |
	total := (totalElements - (elements * page)).
	col := collection last: total.
	(total > elements) 
		ifTrue: [ col := col first: elements ].
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
