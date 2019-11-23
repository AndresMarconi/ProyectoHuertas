Class {
	#name : #Paginator,
	#superclass : #Object,
	#instVars : [
		'page',
		'totalElements'
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

{ #category : #initialization }
Paginator >> initialize [ 
	page := 1
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
	^ totalElements quo: 5
]

{ #category : #'as yet unclassified' }
Paginator >> pagesOn: html [
	1 to: (self pages) do: [ :pageNumber |
		html listItem class:'page-item'; with: [ 
			html anchor 
			class:'page-link';
			callback: [ self page: pageNumber ];
			with: pageNumber ] ]
]

{ #category : #'as yet unclassified' }
Paginator >> paginationOn: html [
	html navigation: [ 
		html unorderedList class:'pagination'; with: [ 
			html listItem class:'page-item active'; with: [ 
				html anchor class:'page-link';
				callback: [ self page: (page - 1) ];
				with:'anterior' ].
			self pagesOn: html.
			html listItem class:'page-item active'; with: [ 
				html anchor class:'page-link';
				callback: [ self page: (page + 1) ];
				with:'siguiente'  ] ] ]
]

{ #category : #'as yet unclassified' }
Paginator >> showElementsOf: collection [
	| total col |
	total := (totalElements - (5 * page)).
	col := collection last: total.
	(total > 5) 
		ifTrue: [ col := col first: 5 ].
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
