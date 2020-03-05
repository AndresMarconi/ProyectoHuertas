Class {
	#name : #WithdrawalPeriodRecommendation,
	#superclass : #FOMObject,
	#instVars : [
		'daysToWait',
		'crop',
		'referenceUrl'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #'instance-creation' }
WithdrawalPeriodRecommendation class >> daysToWait: days crop: crop referenceUrl: url [
	^ self new
		daysToWait: days;
		crop: crop;
		referenceUrl: url;
		yourself
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> crop [
	^ crop
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> crop: anObject [
	crop := anObject
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> daysToWait [
	^ daysToWait
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> daysToWait: anObject [
	daysToWait := anObject
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> referenceUrl [
	^ referenceUrl
]

{ #category : #accessing }
WithdrawalPeriodRecommendation >> referenceUrl: anObject [
	referenceUrl := anObject
]
