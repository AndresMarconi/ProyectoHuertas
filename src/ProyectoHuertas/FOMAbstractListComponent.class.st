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

{ #category : #initialization }
FOMAbstractListComponent >> initialize [ 
	paginator := Paginator newTotalElements: self elements perPage: 10.
]

{ #category : #rendering }
FOMAbstractListComponent >> listElement: element On: html [
	html listGroupItem
		with: [ html row
				class: 'd-flex justify-content-between';
				with: [ html paragraph: [ html text: element rowText ].
					html
						form: [ html formButton
								bePrimary;
								callback: [ self editElement: element ];
								with: [ html span class: 'fa fa-pencil' ].
							html space.
							html formButton
								beDanger;
								callback: [ self removeElement: element ];
								with: [ html span class: 'fa fa-trash' ] ] ] ]
]

{ #category : #rendering }
FOMAbstractListComponent >> listTempleteOn: html [
	html row class:'container'; with: [ 
		html column class:'col-md-12'; with:[
			self elements isEmpty ifTrue: [ html text: 'No hay elementos para mostrar' ]
				ifFalse: [ html listGroup flush with: 
					[ (paginator showElementsOf: (self elements)) do: [ :element | 
						self listElement: element On: html ] ]  ] ] ].
	html row class: 'd-flex justify-content-center'; with: [ paginator renderPaginationOn: html ]
]

{ #category : #accessing }
FOMAbstractListComponent >> paginator: anObject [
	paginator := anObject
]

{ #category : #accessing }
FOMAbstractListComponent >> parent [
	^ parent
]

{ #category : #accessing }
FOMAbstractListComponent >> parent: anObject [
	parent := anObject
]

{ #category : #removing }
FOMAbstractListComponent >> removeElement: element [
	element archive
]

{ #category : #rendering }
FOMAbstractListComponent >> renderContentOn: html [
	html text: self printString
]

{ #category : #rendering }
FOMAbstractListComponent >> renderTableOn: html usingStyle: aStyle [
	html table
		class: aStyle;
		with: [ 
			html tableHead: [ 
				html tableRow: [ 	
					html tableHeading: 'Fecha'.	
					html tableHeading: 'Descripcion'.
					html tableHeading: 'Opciones' ] ].
			html tableBody: [ (paginator showElementsOf: (self elements)) do: [ :element | 
				html tableRow: 	[ 
					html tableData: element date asDate ddmmyyyy.	
					html tableData: element rowText.
					html tableData: [ 
						html form: [ 
				html formButton bePrimary;
					callback: [ self editElement: element ];
					with: [ html span class: 'fa fa-pencil' ].
				html space.
				html formButton beDanger;
					callback: [ self removeElement: element ];
					with: [ html span class: 'fa fa-trash' ] ] ] ] ] ] ]
]

{ #category : #rendering }
FOMAbstractListComponent >> tableTempleteOn: html [
	self renderTableOn: html usingStyle: 'table table-hover'.
	html row
		class: 'd-flex justify-content-center';
		with: [ paginator renderPaginationOn: html ]
]
