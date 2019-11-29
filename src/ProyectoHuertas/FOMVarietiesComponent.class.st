Class {
	#name : #FOMVarietiesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMVarietiesComponent >> editElement: element [
	(self call: (VarietyEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMVarietiesComponent >> elements [
	^ (Variety selectAll) asSortedCollection: [ :a :b | a vulgarName < b vulgarName ]
]

{ #category : #callbacks }
FOMVarietiesComponent >> heading [ 
	^ 'Variedades'
]

{ #category : #printing }
FOMVarietiesComponent >> printOn: aStream [
	aStream nextPutAll: 'Variedades'
]

{ #category : #rendering }
FOMVarietiesComponent >> renderContentOn: html [
	self listTempleteOn: html
]
