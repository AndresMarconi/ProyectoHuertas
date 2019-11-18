"
| app |
  app := WAAdmin register: FOMHomeComponent  asApplicationAt: 'fom'.
  app 	addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary. 
  app sessionClass: FOMSession.
"
Class {
	#name : #FOMHomeComponent,
	#superclass : #WAComponent,
	#instVars : [
		'selectedComponent'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMHomeComponent >> renderContentOn: html [
	self renderNavbarOn: html.
	html
		row: [ html column: [ self renderLeftMenuOn: html ] mediumSize: 2.
			html column: [ html render: selectedComponent ] mediumSize: 10 ]
]

{ #category : #rendering }
FOMHomeComponent >> renderLeftMenuOn: html [
	| item |
	html
		form: [ html
				listGroup: [ {'Lotes' . 'Problemas' . 'Siembras' . 'Cosechas' . 'Aplicaciones'.
					'Ventas'}
						do: [ :ex | 
							item := html listGroupLinkedItem.
							selectedComponent = ex
								ifTrue: [ item beActive ].
							item
								callback: [ selectedComponent := ex ];
								with: ex ] ] ]
]

{ #category : #rendering }
FOMHomeComponent >> renderNavbarOn: html [
	html navigationBar
		with: [ html navigationBarBrand: 'Farm-O-Matic'.
			html
				form: [ html formButton bePrimary
						callback: [ self returnToIntro ];
						with: 'Salir' ] ]
]

{ #category : #rendering }
FOMHomeComponent >> rendererClass [
	^ SBSHtmlCanvas
]
