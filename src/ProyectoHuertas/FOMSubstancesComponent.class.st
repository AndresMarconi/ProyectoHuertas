Class {
	#name : #FOMSubstancesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMSubstancesComponent >> columnHeadings [
	^ {'Nombre comercial'. 'Aptitud'. 'Principios activos'. 'Períodos de carencia' }
]

{ #category : #rendering }
FOMSubstancesComponent >> columnValuesFor: element [
	"{'Nombre comercial'. 'Marca'. 'Componentes activos'. 'Carencia (días)'}"

	^ {element comercialName.
	(self asCommaSeparatedList: element applicabilities).
	(self
		asCommaSeparatedList: (element activeIngredients collect: #tradeName)).
	(self withdrawalStringFor: element)}
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

{ #category : #initialization }
FOMSubstancesComponent >> initialize [
	super initialize.
	duplicateEnabled := true
]

{ #category : #rendering }
FOMSubstancesComponent >> renderActionButtonsFor: element on: html [
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
						class: 'fa fa-clone' ].
			html formButton
				style: 'margin: 2px;';
				beDanger;
				callback: [ self removeElement: element ];
				with: [ html span
						attributeAt: 'title' put: 'Eliminar';
						class: 'fa fa-trash' ] ]
]

{ #category : #rendering }
FOMSubstancesComponent >> withdrawalStringFor: aSubstance [
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
