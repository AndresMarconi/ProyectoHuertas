Class {
	#name : #FOMWithdrawalTimeRecommendationsEditor,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'substance',
		'days',
		'source'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'instance creation' }
FOMWithdrawalTimeRecommendationsEditor class >> substance: aSubstance [
	^ self new
		substance: aSubstance;
		yourself
]

{ #category : #utility }
FOMWithdrawalTimeRecommendationsEditor >> asCommaSeparatedList: aCollectionOfStrings [
	^ aCollectionOfStrings 
		ifEmpty: [ '' ]
		ifNotEmpty: [ :col | col fold: [ :a :b | a , ', ' , b ] ]
]

{ #category : #rendering }
FOMWithdrawalTimeRecommendationsEditor >> renderContentOn: html [
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
						asCommaSeparatedList: (substance activeIngredients collect: #tradeName)) ]
]

{ #category : #accessing }
FOMWithdrawalTimeRecommendationsEditor >> substance: aSubstance [ 
	substance := aSubstance
]
