Class {
	#name : #FOMWithdrawalTimeRecommendationsEditor,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'substance',
		'days',
		'source',
		'editing'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #'instance creation' }
FOMWithdrawalTimeRecommendationsEditor class >> substance: aSubstance [
	^ self new
		substance: aSubstance;
		yourself
]

{ #category : #callbacks }
FOMWithdrawalTimeRecommendationsEditor >> accept [
	| recommendation numberOfDays |
	numberOfDays := [ days asNumber ]
		on: Error
		do: [ days := ''.
			^ self ].
	recommendation := substance recommendationFor: editing.
	recommendation
		ifNil: [ recommendation := WithdrawalPeriodRecommendation
				daysToWait: numberOfDays
				crop: editing
				referenceUrl: source.
			substance addWithdrawalPeriodRecommendation: recommendation ]
		ifNotNil: [ recommendation
				daysToWait: days asNumber;
				referenceUrl: source ].
	substance save.
	editing := nil
]

{ #category : #callbacks }
FOMWithdrawalTimeRecommendationsEditor >> cancel [
	editing := nil
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> crops [
	^ substance registeredCrops
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> days [
	^ days asString
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> days: anObject [
	days := anObject
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> editRecordFor: crop [
	editing := crop.
	(substance recommendationFor: crop)
		ifNil: [ days := ''.
			source := '' ]
		ifNotNil: [ :it | 
			days := it daysToWait.
			source := it referenceUrl ]
]

{ #category : #initialization }
FOMWithdrawalTimeRecommendationsEditor >> initialize [
	super initialize.
	days := 0
]

{ #category : #callbacks }
FOMWithdrawalTimeRecommendationsEditor >> removeWithdrawalRecommentationPeriodFor: aCrop [
	substance
		removeWithdrawalPeriodRecommendation: (substance recommendationFor: aCrop).
	substance save
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderActiveIngredientsOn: html [
	html heading
		level5;
		with: 'Principios activos: '.
	html
		paragraph: [ html
				small:
					'Se para cada par principio activo y cultivo se indican los  residuos máximos establecidos por SENASA para el 2020' ].
	substance activeIngredients
		do: [ :ingredient | 
			html
				paragraph: [ html
						strong: ingredient tradeName , ': ';
						text:
							(self
								asCommaSeparatedList:
									(ingredient senasaApplicabilityRecords
										collect: [ :record | 
											record crop vulgarName , ' (' , record residue printString
												, ' mg/Kg )' ])) ] ]
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderContentOn: html [
	self renderFixedDataOn: html.
	self renderActiveIngredientsOn: html.
	html heading
		level5;
		with: 'Períodos de carencia'.
	editing notNil
		ifTrue: [ html form: [ self renderWithdrawalRecommendationPeriodsOn: html ] ]
		ifFalse: [ self renderWithdrawalRecommendationPeriodsOn: html ]
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderDisplayRowFor: crop on: html [
	| record |
	record := substance recommendationFor: crop.
	^ html
		tableData: crop vulgarName;
		tableData: (record ifNil: [ '?' ] ifNotNil: [ record daysToWait ]);
		tableData: (record ifNil: [ '?' ] ifNotNil: [ record referenceUrl ]);
		tableData: [ editing
				ifNil: [ html anchor
						callback: [ self editRecordFor: crop ];
						with: [ html span
								class: 'fa fa-pencil';
								attributeAt: 'title' put: 'Modificar' ].
					record
						ifNotNil: [ html space.
							html anchor
								callback: [ self removeWithdrawalRecommentationPeriodFor: crop ];
								with: [ html span
										class: 'fa fa-trash';
										attributeAt: 'title' put: 'Borrar' ] ] ] ]
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderEditRowFor: crop on: html [
	| record |
	record := substance recommendationFor: crop.
	html
		tableData: crop vulgarName;
		tableData: [ html textInput
				formControl;
				size: 4;
				on: #days of: self ];
		tableData: [ html textInput
				formControl;
				on: #source of: self ];
		tableData: [ html formButton
				bePrimary;
				callback: [ self accept ];
				with: 'Aceptar'.
			html space.
			html formButton
				beSecondary;
				callback: [ self cancel ];
				with: 'Cancelar' ]
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderFixedDataOn: html [
	html heading
		level5;
		with: 'Nombre comercial: '.
	html paragraph: substance comercialName.
	html heading
		level5;
		with: 'Aptitud:  '.
	html
		paragraph: (self asCommaSeparatedList: substance applicabilities).

]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderWithdrawalRecommendationPeriodsOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableRow: [ {'Cultivo' . 'Carencia (días)' . 'Fuente' . 'Acciones'}
								do: [ :heading | html tableHeading: heading ] ] ].
			html
				tableBody: [ self crops
						do: [ :crop | 
							html
								tableRow: [ editing = crop
										ifFalse: [ self renderDisplayRowFor: crop on: html ]
										ifTrue: [ self renderEditRowFor: crop on: html ] ] ] ] ]
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> source [
	^ source
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> source: anObject [
	source := anObject
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> substance [
	^ substance
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> substance: aSubstance [ 
	substance := aSubstance
]
