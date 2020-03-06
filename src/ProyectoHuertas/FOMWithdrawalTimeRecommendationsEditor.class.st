Class {
	#name : #FOMWithdrawalTimeRecommendationsEditor,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'substance',
		'days',
		'source',
		'selectedCrop'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'instance creation' }
FOMWithdrawalTimeRecommendationsEditor class >> substance: aSubstance [
	^ self new
		substance: aSubstance;
		yourself
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> addWithdrawalTimeRecord [
	substance
		addWithdrawalPeriodRecommendation:
			(WithdrawalPeriodRecommendation
				daysToWait: days
				crop: selectedCrop
				referenceUrl: source).
	substance save
]

{ #category : #utility }
FOMWithdrawalTimeRecommendationsEditor >> asCommaSeparatedList: aCollectionOfStrings [
	^ aCollectionOfStrings 
		ifEmpty: [ '' ]
		ifNotEmpty: [ :col | col fold: [ :a :b | a , ', ' , b ] ]
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> crops [
	^ self session crops
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> days [
	^ days asString
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> days: anObject [
	days := anObject asNumber
]

{ #category : #initialization }
FOMWithdrawalTimeRecommendationsEditor >> initialize [
	super initialize.
	days := 0
]

{ #category : #callbacks }
FOMWithdrawalTimeRecommendationsEditor >> removeWithdrawalRecommentationPeriod: aWithdrawalPeriodRecommendation [
	substance
		removeWithdrawalPeriodRecommendation: aWithdrawalPeriodRecommendation.
	substance save
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderAddWithdrawalRecommendationFormOn: html [
	html
		form: [ html select
				list: self crops;
				callback: [ :value | selectedCrop := value ].
			html space.
			html textInput
				on: #days of: self;
				placeholder: 'Días de carencia'.
			html space.
			html textInput
				on: #source of: self;
				placeholder: 'Fuente consultada';
				size: 60.
			html space.
			html submitButton
				callback: [ self addWithdrawalTimeRecord ];
				with: 'Agregar' ]
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderContentOn: html [
	self renderFixedDataOn: html.
	html heading
		level5;
		with: 'Períodos de carencia'.
	self renderWithdrawalRecommendationPeriodsOn: html.
	self renderAddWithdrawalRecommendationFormOn: html
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderFixedDataOn: html [
	html heading
		level4;
		with: substance comercialName.
	html
		paragraph: [ html
				strong: 'Uso: ';
				text: substance usage ].
	html
		paragraph: [ html
				strong: 'Principios activos: ';
				text:
					(self
						asCommaSeparatedList: (substance activeIngredients collect: #tradeName)) ].
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderWithdrawalRecommendationPeriodsOn: html [
	html
		unorderedList: [ substance withdrawalPeriodRecommendations
				do: [ :each | 
					html
						listItem: [ html
								text:
									each crop vulgarName , ' (' , each daysToWait asString, ' días) - '
										, each referenceUrl.
							html space.
							html anchor
								callback: [ self removeWithdrawalRecommentationPeriod: each ];
								with: [ html span class: 'fa fa-trash' ] ] ] ]
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
