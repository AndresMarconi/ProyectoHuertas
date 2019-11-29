Class {
	#name : #FOMAbstractListComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'paginator'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMAbstractListComponent >> editElement: element [
]

{ #category : #accessing }
FOMAbstractListComponent >> elements [ 
	^ (OrderedCollection new)
]

{ #category : #'t-rotating' }
FOMAbstractListComponent >> heading [ 
	^ 'abstract tittle'
]

{ #category : #'as yet unclassified' }
FOMAbstractListComponent >> listElement: element On: html [
	html listGroupItem with: [ 
		html row class:'d-flex justify-content-between'; with: [ 
			html paragraph: [ html text: (element rowText) ].
			html form: [ 
				html formButton bePrimary;
					callback: [ self editElement: element ];
					with: 'Modificar' ] ] ].
]

{ #category : #'as yet unclassified' }
FOMAbstractListComponent >> listTempleteOn: html [
	paginator := Paginator newTotalElements: self elements perPage: 10.
	html row class:'container'; with: [ 
		html column class:'col-md-12'; with:[
			html heading level2 with: (self heading).
			self elements isEmpty ifTrue: [ html text: 'No hay elementos para mostrar' ]
				ifFalse: [ html listGroup flush with: 
					[ (paginator showElementsOf: (self elements)) do: [ :element | 
						self listElement: element On: html ] ]  ] ] ].
	html row class: 'd-flex justify-content-center'; with: [ paginator paginationOn: html ]
]

{ #category : #accessing }
FOMAbstractListComponent >> parent [
	^ parent
]

{ #category : #accessing }
FOMAbstractListComponent >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
FOMAbstractListComponent >> renderContentOn: html [
	html text: self printString
]
