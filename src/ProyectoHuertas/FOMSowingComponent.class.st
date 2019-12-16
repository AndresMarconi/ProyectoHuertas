Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMSowingComponent >> editElement: element [
	(self call: (SowingEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMSowingComponent >> elements [
	^ (self session sowings) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #'t-rotating' }
FOMSowingComponent >> heading [ 
	^ 'Siembras'
]

{ #category : #printing }
FOMSowingComponent >> printOn: aStream [
	aStream nextPutAll: 'Siembra'
]

{ #category : #rendering }
FOMSowingComponent >> renderContentOn: html [
	self tableTempleteOn: html.
]
