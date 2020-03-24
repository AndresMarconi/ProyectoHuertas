Class {
	#name : #SubstancesComponent,
	#superclass : #GAFAbstractTableWithOptionsComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
SubstancesComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Principios activos' . 'Aptitud' . 'Períodos de carencia'}
		, super columnHeadings
]

{ #category : #rendering }
SubstancesComponent >> columnValuesFor: substance [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {substance comercialName.
	(self
		asCommaSeparatedList: (substance activeIngredients collect: #tradeName)).
	(self
		asCommaSeparatedList:
			(SenasaCatalogue singleton
				combinedApplicabilitiesFor: (substance activeIngredients collect: #tradeName))).
	(self withdrawalStringFor: substance)}
		, (super columnValuesFor: substance)
]

{ #category : #callbacks }
SubstancesComponent >> editWithdrawalPeriodRecommendations: aSubstance [
	self
		call: (WithdrawalTimeRecommendationsEditor substance: aSubstance)
]

{ #category : #hooks }
SubstancesComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ Substance 
]

{ #category : #hooks }
SubstancesComponent >> elementEditorClass [
	"Returns the class of editor used to edit elements"

	^ SubstanceEditor
]

{ #category : #accessing }
SubstancesComponent >> elements [
	^ self session gapAFarm substances
]

{ #category : #initialization }
SubstancesComponent >> initialize [
	super initialize.
	duplicateEnabled := true
]

{ #category : #rendering }
SubstancesComponent >> renderActionButtonsFor: element on: html [
	html
		form: [ html formButton
				style: 'margin: 2px;';
				bePrimary;
				callback: [ self editElement: element ];
				with: [ html span
						attributeAt: 'title' put: 'Modificar';
						class: 'fa fa-pencil' ].
			html formButton
				style: 'margin: 2px;';
				bePrimary;
				callback: [ self editWithdrawalPeriodRecommendations: element ];
				with: [ html span
						attributeAt: 'title' put: 'Ajustar tiempos de carencia';
						class: 'fa fa-calendar-times-o' ].
			html formButton
				style: 'margin: 2px;';
				bePrimary;
				callback: [ self duplicateElement: element ];
				with: [ html span
						attributeAt: 'title' put: 'Duplicar';
						class: 'fa fa-clone' ] ]
]

{ #category : #rendering }
SubstancesComponent >> withdrawalStringFor: aSubstance [
	| stream |
	stream := String new writeStream.
	(aSubstance withdrawalPeriodRecommendationsByDays associations
		asSortedCollection: [ :a :b | a key < b key ])
		do: [ :association | 
			association value
				do: [ :recommendation| stream nextPutAll:  recommendation crop vulgarName ]
				separatedBy: [ stream nextPutAll: ', ' ].
			stream nextPutAll: ': '.
			stream
				nextPutAll: association key asString;
				nextPutAll: ' días' ]
		separatedBy: [ stream nextPutAll: ' - ' ].
	^ stream contents
]
