Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'paginator'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> editHarvesting: harvesting [
	(self call: (HarvestingEditor subject: harvesting))
		ifNotNil: [ :it | it save ]
]

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> harvestings [
	^ (Harvesting selectAll) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #initialization }
FOMHarvestComponent >> initialize [ 
	paginator := Paginator newTotalElements: self harvestings perPage: 10
]

{ #category : #'as yet unclassified' }
FOMHarvestComponent >> listHarvesting: harvesting On: html [
	html listGroupItem with: [ 
		html row class:'d-flex justify-content-between'; with: [ 
			html paragraph: [ html text: harvesting rowText ].
			html form: [ 
				html formButton bePrimary;
					callback: [ self editHarvesting: harvesting ];
					with: 'Modificar' ] ] ].
]

{ #category : #printing }
FOMHarvestComponent >> printOn: aStream [
	aStream nextPutAll: 'Cosecha'
]

{ #category : #printing }
FOMHarvestComponent >> renderContentOn: html [
	html row class:'container'; with: [ 
		html column class:'col-md-12'; with:[
			html heading level2 with: 'Cosechas'.			
			html listGroup flush with: [ (paginator showElementsOf: (self harvestings)) do: [ :harvesting | 
					self listHarvesting: harvesting On: html ] ] ] ].
	html row class: 'd-flex justify-content-center'; with: [ paginator paginationOn: html ]
]
