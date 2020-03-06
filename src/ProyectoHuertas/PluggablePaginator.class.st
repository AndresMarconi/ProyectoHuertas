Class {
	#name : #PluggablePaginator,
	#superclass : #Object,
	#instVars : [
		'currentPage',
		'subject',
		'selector',
		'elementsPerPage'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #'instance creation' }
PluggablePaginator class >> subject: anObject selector: aSelector elementsPerPage: aNumber [
	^ self new
		subject: anObject;
		selector: aSelector;
		elementsPerPage: aNumber;
		yourself
]

{ #category : #accessing }
PluggablePaginator >> currentPage [
	^ currentPage
]

{ #category : #accessing }
PluggablePaginator >> currentPage: anObject [
	currentPage := anObject
]

{ #category : #accessing }
PluggablePaginator >> elementCount [
	^ self elements size
]

{ #category : #accessing }
PluggablePaginator >> elements [
	^ subject perform: selector
]

{ #category : #accessing }
PluggablePaginator >> elementsPerPage [
	^ elementsPerPage
]

{ #category : #accessing }
PluggablePaginator >> elementsPerPage: anObject [
	elementsPerPage := anObject
]

{ #category : #initialization }
PluggablePaginator >> initialize [ 
	currentPage := 1
]

{ #category : #accessing }
PluggablePaginator >> pageCount [ 
	^ (elementsPerPage quo: self elements size) + 1 
]

{ #category : #rendering }
PluggablePaginator >> renderItem: simbol Number: aNumber Active: boolean on: html [
	html listItem
		class: 'page-item ', (boolean ifTrue: [ 'active' ]);
		with: [ html anchor
			class: 'page-link';
			callback: [ currentPage := aNumber ];
			with: simbol ]
]

{ #category : #rendering }
PluggablePaginator >> renderNextButtonOn: html [
	currentPage = self pageCount
		ifTrue: [ html listItem
				class: 'page-item disabled';
				with: [ html anchor
						class: 'page-link';
						callback: [ currentPage := currentPage + 1 ];
						with: 'siguiente' ] ]
		ifFalse: [ html listItem
				class: 'page-item';
				with: [ html anchor
						class: 'page-link';
						callback: [ currentPage := currentPage + 1 ];
						with: 'siguiente' ] ]
]

{ #category : #rendering }
PluggablePaginator >> renderPagesOn: html [
	
	1 to: self pageCount do: [ :pageNumber | 
		currentPage = pageNumber
			ifTrue: [ self renderItem: pageNumber Number: pageNumber Active: true on: html ]
			ifFalse: [ self renderItem: pageNumber Number: pageNumber Active: false on: html ] ]
]

{ #category : #rendering }
PluggablePaginator >> renderPaginationOn: html [
	elementsPerPage < self elementCount
		ifTrue: [ ^ self ].
	html
		navigation: [ html unorderedList
				class: 'pagination';
				with: [ self renderPreviousButtonOn: html.
					self renderPagesOn: html.
					self renderNextButtonOn: html ] ]
]

{ #category : #rendering }
PluggablePaginator >> renderPreviousButtonOn: html [
	currentPage = 1
		ifTrue: [ html listItem
				class: 'page-item disabled';
				with: [ html anchor
						class: 'page-link';
						callback: [ currentPage := currentPage - 1 ];
						with: 'anterior' ] ]
		ifFalse: [ html listItem
				class: 'page-item';
				with: [ html anchor
						class: 'page-link';
						callback: [ currentPage := currentPage - 1 ];
						with: 'anterior' ] ]
]

{ #category : #initialization }
PluggablePaginator >> selectElementsIn: collection [
	| total col |
	self elementCount < elementsPerPage
		ifTrue: [ total := elementsPerPage
				- (self elementCount * (currentPage - 1)).
			col := collection last: total.
			total > self elementCount
				ifTrue: [ col := col first: self elementCount ] ]
		ifFalse: [ col := collection ].
	^ col
]

{ #category : #accessing }
PluggablePaginator >> selector [
	^ selector
]

{ #category : #accessing }
PluggablePaginator >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
PluggablePaginator >> subject [
	^ subject
]

{ #category : #accessing }
PluggablePaginator >> subject: anObject [
	subject := anObject
]
