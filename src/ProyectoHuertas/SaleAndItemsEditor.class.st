Class {
	#name : #SaleAndItemsEditor,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'sale',
		'saleEditor',
		'saleListItemsEditor'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #accessing }
SaleAndItemsEditor class >> subject: anObject [
	^ self new
		sale: anObject;
		saleEditor: (SaleEditor subject: anObject);
		saleListItemsEditor: (SaleListItemEditor subject: anObject);
		initParents;
		yourself
]

{ #category : #visiting }
SaleAndItemsEditor >> accept [
	self saveComponent.
	parent
		ifNil: [ self answer: sale ]
		ifNotNil: [ :it | it answer: sale ]
	
]

{ #category : #initialization }
SaleAndItemsEditor >> initParents [
	saleListItemsEditor parent: self.
	saleEditor parent: self.
]

{ #category : #rendering }
SaleAndItemsEditor >> renderContentOn: html [
	html render: saleEditor.
	html render: saleListItemsEditor.
	html break; break.
	html form: [ 
		html formButton
			bePrimary;
			callback: [ self accept ];
			with: 'Accept'  ]
	
]

{ #category : #accessing }
SaleAndItemsEditor >> sale [
	^ sale
]

{ #category : #accessing }
SaleAndItemsEditor >> sale: anObject [
	sale := anObject.
]

{ #category : #accessing }
SaleAndItemsEditor >> saleEditor [
	^ saleEditor
]

{ #category : #accessing }
SaleAndItemsEditor >> saleEditor: anObject [
	saleEditor := anObject
]

{ #category : #accessing }
SaleAndItemsEditor >> saleListItemsEditor [
	^ saleListItemsEditor
]

{ #category : #accessing }
SaleAndItemsEditor >> saleListItemsEditor: anObject [
	saleListItemsEditor := anObject
]

{ #category : #callbacks }
SaleAndItemsEditor >> saveComponent [
	saleEditor accept.
	saleListItemsEditor accept.
	saleListItemsEditor initializeComponents
	
]
