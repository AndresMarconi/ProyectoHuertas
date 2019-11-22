Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMSowingComponent >> editSowing: sowing [
	(self call: (SowingEditor subject: sowing))
		ifNotNil: [ :it | it save ]
]

{ #category : #'as yet unclassified' }
FOMSowingComponent >> listSowing: sowing On: html [
	html listGroupItem: [ 
		html row class:'d-flex justify-content-between'; with: [ 
			html paragraph: [ html text: sowing variety; text: ' sembrado el ';	text: sowing date ].
			html form: [ 
				html formButton bePrimary;
					callback: [ self editSowing: sowing ];
					with: 'Modificar' ] ] ].
]

{ #category : #printing }
FOMSowingComponent >> printOn: aStream [
	aStream nextPutAll: 'Siembra'
]

{ #category : #rendering }
FOMSowingComponent >> renderContentOn: html [
	html row class:'container'; with: [ 
		html column class:'col-md-12'; with:[
			html heading level2 with: 'Siembras'.			
			html listGroup flush with: [ self sowings do: [ :sowing | self listSowing: sowing On: html ] ].
			html
			]
		 ].
]

{ #category : #accessing }
FOMSowingComponent >> sowings [
	^ (Sowing selectAll) asSortedCollection: [ :a :b | a date > b date ]
]
