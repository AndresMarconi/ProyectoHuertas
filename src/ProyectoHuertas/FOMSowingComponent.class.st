Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'page'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMSowingComponent >> editSowing: sowing [
	(self call: (SowingEditor subject: sowing))
		ifNotNil: [ :it | it save ]
]

{ #category : #initialization }
FOMSowingComponent >> initialize [ 
	page := 1
]

{ #category : #'as yet unclassified' }
FOMSowingComponent >> listSowing: sowing On: html [
	html listGroupItem: [ 
		html row class:'d-flex justify-content-between'; with: [ 
			html paragraph: [ html text: sowing variety; text: ' sembrado el ';	text: sowing date ].
			html form: [ 
				html formButton bePrimary;
					callback: [ self editSowing: sowing ];
					with: 'Modificar' ] ] ].
]

{ #category : #initialization }
FOMSowingComponent >> page [ 	
	^ page
]

{ #category : #initialization }
FOMSowingComponent >> page: num [
	page:= num
	
]

{ #category : #accessing }
FOMSowingComponent >> pages [ 
	^ (self sowings size) quo: 5
]

{ #category : #'as yet unclassified' }
FOMSowingComponent >> pagesOn: html [
	| pages |
	pages := self pages.
	1 to: pages do: [ :pageNumber |
		html listItem class:'page-item'; with: [ 
			html anchor 
			class:'page-link';
			callback: [ self page: pageNumber ];
			with: pageNumber ] ]
]

{ #category : #'as yet unclassified' }
FOMSowingComponent >> paginationOn: html [
	html navigation: [ 
		html unorderedList class:'pagination'; with: [ 
			html listItem class:'page-item'; with: [ 
				html anchor class:'page-link';
				callback: [ self page: (page - 1) ];
				with:'anterior' ].
			self pagesOn: html.
			html listItem class:'page-item'; with: [ 
				html anchor class:'page-link';
				callback: [ self page: (page + 1) ];
				with:'siguiente'  ] ] ]
]

{ #category : #printing }
FOMSowingComponent >> printOn: aStream [
	aStream nextPutAll: 'Siembra'
]

{ #category : #rendering }
FOMSowingComponent >> renderContentOn: html [
	html row class:'container'; with: [ 
		html column class:'col-md-12'; with:[
			html heading level2 with: 'Siembras'.			
			html listGroup flush with: [ (self showElementsOf: (self sowings) In: self page)  do: [ :sowing | 
					self listSowing: sowing On: html ] ] ] ].
	html row class: 'd-flex justify-content-center'; with: [ self paginationOn: html ]
]

{ #category : #'as yet unclassified' }
FOMSowingComponent >> showElementsOf: collection In: pageNumber [
	| total col |
	total := ((collection size) - (5 * pageNumber)).
	col := collection last: total.
	(total > 5) 
		ifTrue: [ col := collection first: 5 ].
	^ col
	 
]

{ #category : #accessing }
FOMSowingComponent >> sowings [
	^ (Sowing selectAll) asSortedCollection: [ :a :b | a date > b date ]
]
