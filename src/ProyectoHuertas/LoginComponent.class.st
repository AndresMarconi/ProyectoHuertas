Class {
	#name : #LoginComponent,
	#superclass : #FOMMainComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'ProyectoHuertas-view'
}

{ #category : #'as yet unclassified' }
LoginComponent >> inputsWith: anHtmlCanvas [
	anHtmlCanvas heading: 'Inputs'. 
	anHtmlCanvas unorderedList: [  
		(self session sistema inputs) do: [ :input | 
			anHtmlCanvas listItem: input product ] ].
]

{ #category : #'as yet unclassified' }
LoginComponent >> listAplication: aPlot With: anHtmlCanvas [
	aPlot aplications do:[ : aplication | 
		anHtmlCanvas listItem with: [ 
			anHtmlCanvas text: 'aplication of '.
			anHtmlCanvas text: aplication input ] ].
]

{ #category : #'as yet unclassified' }
LoginComponent >> listFarm: aFarm With: anHtmlCanvas [
	anHtmlCanvas listItem: aFarm name.
		anHtmlCanvas unorderedList: [ 
			aFarm plots do:[ :plot | 
				self listPlot: plot With: anHtmlCanvas ] ]
]

{ #category : #'as yet unclassified' }
LoginComponent >> listHarvest: aPlot With: anHtmlCanvas [
	aPlot harvests do:[ :harvest | 
		anHtmlCanvas listItem with: [ 
			anHtmlCanvas text: 'harvest of '.
			anHtmlCanvas text: harvest sowing product name ] ]
]

{ #category : #'as yet unclassified' }
LoginComponent >> listPlot: aPlot With: anHtmlCanvas [
	anHtmlCanvas listItem with: [ 
		anHtmlCanvas text: 'plot '. 
		anHtmlCanvas text: aPlot id ].
	anHtmlCanvas unorderedList: [ 
		self listSowing: aPlot  With: anHtmlCanvas. 
		self listProblem: aPlot  With: anHtmlCanvas.
		self listAplication: aPlot  With: anHtmlCanvas.
		self listHarvest: aPlot  With: anHtmlCanvas. ]
]

{ #category : #'as yet unclassified' }
LoginComponent >> listProblem: aPlot With: anHtmlCanvas [
	aPlot problems do:[ : problem | 
		anHtmlCanvas listItem with: [ 
			anHtmlCanvas text: 'problem of '.
			anHtmlCanvas text: problem  name ] ].
]

{ #category : #'as yet unclassified' }
LoginComponent >> listSowing: aPlot With: anHtmlCanvas [
	aPlot sowings do:[ :sowing | 
		anHtmlCanvas listItem with: [ 
			anHtmlCanvas text: 'sowing of '.
			anHtmlCanvas text: sowing product name ] ].
]

{ #category : #'as yet unclassified' }
LoginComponent >> listUser: aUser With: anHtmlCanvas [
	anHtmlCanvas listItem: aUser username.
		anHtmlCanvas unorderedList: [ 
			aUser farms do:[ :farm | 
				self listFarm: farm With: anHtmlCanvas ] ]
]

{ #category : #'as yet unclassified' }
LoginComponent >> productsWith: anHtmlCanvas [
	anHtmlCanvas heading: 'Products'. 
	anHtmlCanvas unorderedList: [  
		(self session sistema products) do: [ :product | 
			anHtmlCanvas listItem: [ 
				anHtmlCanvas text: product name.
				anHtmlCanvas space.
				anHtmlCanvas text: product variety ] ] ].
]

{ #category : #rendering }
LoginComponent >> renderContentOn: anHtmlCanvas [
	self usersWith: anHtmlCanvas.
	self inputsWith: anHtmlCanvas.
	self productsWith: anHtmlCanvas.
]

{ #category : #'as yet unclassified' }
LoginComponent >> usersWith:anHtmlCanvas [
	anHtmlCanvas heading: 'Users'.
	anHtmlCanvas unorderedList: [  
		(self session sistema users) do: [ :user | 
			self listUser: user With: anHtmlCanvas ] ].
]
