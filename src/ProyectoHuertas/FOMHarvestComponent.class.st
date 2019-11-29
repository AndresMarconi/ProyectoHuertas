Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> editElement: element [
	(self call: (HarvestingEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> elements [
	^ (Harvesting selectAll) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMHarvestComponent >> heading [ 	
	^ 'Cosechas'
]

{ #category : #printing }
FOMHarvestComponent >> printOn: aStream [
	aStream nextPutAll: 'Cosecha'
]

{ #category : #printing }
FOMHarvestComponent >> renderContentOn: html [
	self listTempleteOn: html
]
