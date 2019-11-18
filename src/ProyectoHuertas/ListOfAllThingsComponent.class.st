"
| app |
  app := WAAdmin register: ListOfAllThingsComponent  asApplicationAt: 'list'.
  app 	addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary.
  app sessionClass: FOMSession.
"
Class {
	#name : #ListOfAllThingsComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'ProyectoHuertas-ui-lists'
}

{ #category : #initialization }
ListOfAllThingsComponent class >> initialize [
	"self initialize"

	| app |
	app := WAAdmin register: self asApplicationAt: 'login'.
	app
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary;
		addLibrary: SBSDevelopmentLibrary.
	app sessionClass: FOMSession
]

{ #category : #callbacks }
ListOfAllThingsComponent >> addSubstance [
	| substance |
	substance := self call: (SubstanceEditor subject: Substance new).
	substance ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
ListOfAllThingsComponent >> editSubstance: substance [
	(self call: (SubstanceEditor subject: substance))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
ListOfAllThingsComponent >> removeSubstance: substance [
	substance remove
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderAplication: aPlot on: anHtmlCanvas [
	aPlot aplications
		do: [ :aplication | 
			anHtmlCanvas listItem
				with: [ anHtmlCanvas text: 'aplication of '.
					anHtmlCanvas text: aplication substance comercialName ] ]
]

{ #category : #rendering }
ListOfAllThingsComponent >> renderContentOn: anHtmlCanvas [
	self renderExampleButtonsOn: anHtmlCanvas.
	self renderSubstancesOn: anHtmlCanvas.
	self renderUsersOn: anHtmlCanvas
]

{ #category : #rendering }
ListOfAllThingsComponent >> renderExampleButtonsOn: anHtmlCanvas [
	anHtmlCanvas anchor
		callback: [ FOMVoyageExampleLoader new load ];
		with: [ anHtmlCanvas formButton
				bePrimary;
				with: 'Cargar ejemplos' ].
	anHtmlCanvas space.
	anHtmlCanvas anchor
		callback: [ self addSubstance ];
		with: [ anHtmlCanvas formButton
				bePrimary;
				with: 'Agregar substancia' ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderFarm: aFarm on: anHtmlCanvas [
	anHtmlCanvas listItem: aFarm name.
		anHtmlCanvas unorderedList: [ 
			aFarm plots do:[ :plot | 
				self renderPlot: plot on: anHtmlCanvas ] ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderHarvest: aPlot on: anHtmlCanvas [
	aPlot harvests
		do: [ :harvest | 
			anHtmlCanvas listItem
				with: [ anHtmlCanvas text: 'harvest of '.
					anHtmlCanvas text: harvest variety vulgarName ] ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderPlot: aPlot on: anHtmlCanvas [
	anHtmlCanvas listItem with: [ 
		anHtmlCanvas text: 'plot '. 
		anHtmlCanvas text: aPlot id ].
	anHtmlCanvas unorderedList: [ 
		self renderSowing: aPlot  on: anHtmlCanvas. 
		self renderProblem: aPlot  on: anHtmlCanvas.
		self renderAplication: aPlot  on: anHtmlCanvas.
		self renderHarvest: aPlot  on: anHtmlCanvas. ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderProblem: aPlot on: anHtmlCanvas [
	aPlot problems do:[ : problem | 
		anHtmlCanvas listItem with: [ 
			anHtmlCanvas text: 'problem of '.
			anHtmlCanvas text: problem  name ] ].
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderProductsOn: anHtmlCanvas [
	anHtmlCanvas heading: 'Products'. 
	anHtmlCanvas unorderedList: [  
		(self session sistema products) do: [ :product | 
			anHtmlCanvas listItem: [ 
				anHtmlCanvas text: product name.
				anHtmlCanvas space.
				anHtmlCanvas text: product variety ] ] ].
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderSowing: aPlot on: anHtmlCanvas [
	aPlot sowings
		do: [ :sowing | 
			anHtmlCanvas listItem
				with: [ anHtmlCanvas text: 'sowing of '.
					anHtmlCanvas text: sowing variety vulgarName ] ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderSubstancesOn: anHtmlCanvas [
	anHtmlCanvas heading: 'Substancias'.
	anHtmlCanvas
		unorderedList: [ self session substances
				do: [ :substance | 
					anHtmlCanvas
						listItem: [ anHtmlCanvas
								text: substance comercialName;
								space.
							anHtmlCanvas anchor
								callback: [ self editSubstance: substance ];
								with: 'Editar'.
							anHtmlCanvas space.
							anHtmlCanvas anchor
								callback: [ self removeSubstance: substance ];
								with: 'Eliminar' ] ] ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderUser: aUser on: anHtmlCanvas [
	anHtmlCanvas listItem: aUser username.
		anHtmlCanvas unorderedList: [ 
			aUser farms do:[ :farm | 
				self renderFarm: farm on: anHtmlCanvas ] ]
]

{ #category : #'as yet unclassified' }
ListOfAllThingsComponent >> renderUsersOn:anHtmlCanvas [
	anHtmlCanvas heading: 'Users'.
	anHtmlCanvas unorderedList: [  
		(self session users) do: [ :user | 
			self renderUser: user on: anHtmlCanvas ] ].
]
