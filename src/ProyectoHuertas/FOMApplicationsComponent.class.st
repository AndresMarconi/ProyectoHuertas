Class {
	#name : #FOMApplicationsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMApplicationsComponent >> editElement: element [
	(self call: (AplicationEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMApplicationsComponent >> elements [
	^ (Application selectMany: [ :each | each archived ]) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #callbacks }
FOMApplicationsComponent >> heading [ 
	^ 'Aplicaciones'
]

{ #category : #printing }
FOMApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]

{ #category : #printing }
FOMApplicationsComponent >> renderContentOn: html [
	self listTempleteOn: html.
]
