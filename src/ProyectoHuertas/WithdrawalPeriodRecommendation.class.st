Class {
	#name : #WithdrawalPeriodRecommendation,
	#superclass : #FOMObject,
	#instVars : [
		'daysToWait',
		'cropsAffected',
		'referenceUrl'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #accessing }
WithdrawalPeriodRecommendation >> cropsAffected [
	^ cropsAffected
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> cropsAffected: anObject [
	cropsAffected := anObject
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> daysToWait [
	^ daysToWait
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> daysToWait: anObject [
	daysToWait := anObject
]

{ #category : #initialization }
WithdrawalPeriodRecommendation >> initialize [
	cropsAffected := OrderedCollection new
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> referenceUrl [
	^ referenceUrl
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> referenceUrl: anObject [
	referenceUrl := anObject
]
