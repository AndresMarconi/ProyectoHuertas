Class {
	#name : #Campaign,
	#superclass : #FOMObject,
	#instVars : [
		'startDate',
		'endDate'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
Campaign class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
Campaign class >> newWithYear: aYear StartDate: sDate EndDate: eDate [
	| campaing |
	campaing := self new.
	^ campaing 
		year: aYear;
		startDate: sDate;
		endDate: eDate.
]

{ #category : #'instance creation' }
Campaign class >> startDate: sDate endDate: eDate [
	^ self new
		startDate: sDate;
		endDate: eDate;
		archived: true;
		yourself
]

{ #category : #'submorphs-add/remove' }
Campaign >> delete [ 
	archived:= false.
]

{ #category : #accessing }
Campaign >> endDate [
	^ endDate
]

{ #category : #accessing }
Campaign >> endDate: anObject [
	endDate := anObject
]

{ #category : #'as yet unclassified' }
Campaign >> rowText [
	^ 'Campaña desde ', startDate asString , ' hasta ', endDate asString.
]

{ #category : #accessing }
Campaign >> startDate [
	^ startDate
]

{ #category : #accessing }
Campaign >> startDate: anObject [
	startDate := anObject
]
