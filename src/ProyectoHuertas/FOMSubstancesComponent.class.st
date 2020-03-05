Class {
	#name : #FOMSubstancesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMSubstancesComponent >> asCommaSeparatedList: activeIngredients [
	^ (activeIngredients collect: #tradeName)
		ifEmpty: [ '' ]
		ifNotEmpty: [ :col | col fold: [ :a :b | a , ', ' , b ] ]
]

{ #category : #rendering }
FOMSubstancesComponent >> columnHeadings [
	^ {'Nombre comercial'. 'Uso'. 'Principios activos'. }
]

{ #category : #rendering }
FOMSubstancesComponent >> columnValuesFor: element [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {element comercialName.
	element usage.
	(self asCommaSeparatedList: element activeIngredients)}
]

{ #category : #callbacks }
FOMSubstancesComponent >> editWithdrawalPeriodRecommendations: aSubstance [
	self
		call: (FOMWithdrawalTimeRecommendationsEditor substance: aSubstance)
]

{ #category : #hooks }
FOMSubstancesComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Substance 
]

{ #category : #hooks }
FOMSubstancesComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SubstanceEditor
]

{ #category : #accessing }
FOMSubstancesComponent >> elements [
	^ (self session substances) asSortedCollection: [ :a :b | a comercialName < b comercialName ]
]

{ #category : #rendering }
FOMSubstancesComponent >> renderActionButtonsFor: element on: html [
	html
		form: [ html formButton
				bePrimary;
				callback: [ self editElement: element ];
				with: [ html span class: 'fa fa-pencil' ].
			html space.
			html formButton
				bePrimary;
				callback: [ self editWithdrawalPeriodRecommendations: element ];
				with: [ html span class: 'fa fa-calendar-times-o' ].
			html space.
			html formButton
				beDanger;
				callback: [ self removeElement: element ];
				with: [ html span class: 'fa fa-trash' ] ]
]
