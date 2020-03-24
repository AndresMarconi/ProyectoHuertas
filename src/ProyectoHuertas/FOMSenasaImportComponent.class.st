Class {
	#name : #FOMSenasaImportComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'selectedCrops',
		'selectedCropsComponent',
		'missingRecords'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #initialization }
FOMSenasaImportComponent >> computeMissingRecords [
	| existing missing allFromSenasa alreadyImported |
	allFromSenasa := self currentSenasaCatalogue records.
	alreadyImported := self session senasaApplicabilityRecords.
	existing := allFromSenasa
		select: [ :newRecord | 
			alreadyImported
				anySatisfy: [ :existingRecord | 
					existingRecord crop = newRecord crop
						& (existingRecord activeIngredient = newRecord activeIngredient) ] ].
	missing := allFromSenasa
		reject: [ :newRecord | 
			alreadyImported
				anySatisfy: [ :existingRecord | 
					existingRecord crop = newRecord crop
						& (existingRecord activeIngredient = newRecord activeIngredient) ] ].
	^ missing
]

{ #category : #initialization }
FOMSenasaImportComponent >> currentSenasaCatalogue [
	^ SenasaCatalog
		twentyTwentyWithExistingCrops: self session crops
		andExistingActiveIngredientes: self session activeIngredients
]

{ #category : #callbacks }
FOMSenasaImportComponent >> importRecordsForSelectedCrops [
	| selectedRecords |
	selectedCropsComponent accept.
	selectedRecords := missingRecords
		select: [ :each | selectedCrops includes: each crop ].
	selectedRecords
		do: [ :record | 
			record crop save.
			record activeIngredient 
				addApplicabilities: record applicabilities;
				save.
			record save ].
	self answer
]

{ #category : #initialization }
FOMSenasaImportComponent >> initialize [
	super initialize.
	selectedCropsComponent := MultipleSelectPropertyEditorComponent
		subject: self
		selector: #selectedCrops
		label: 'Seleccione los cultivos a incluir'
		required: false.
	selectedCropsComponent rows: 20.
	self updateSelectableCrops
]

{ #category : #rendering }
FOMSenasaImportComponent >> renderCatalogSummaryOn: html [
	
]

{ #category : #rendering }
FOMSenasaImportComponent >> renderContentOn: html [
	self renderCatalogSummaryOn: html.
	self renderImportFormOn: html
]

{ #category : #rendering }
FOMSenasaImportComponent >> renderImportFormOn: html [
	html
		form: [ html render: selectedCropsComponent.
			html
				paragraph: [ html formButton
						bePrimary;
						callback: [ self importRecordsForSelectedCrops ];
						with: 'Importar' ] ]
]

{ #category : #accessing }
FOMSenasaImportComponent >> selectedCrops [
	^ selectedCrops
]

{ #category : #accessing }
FOMSenasaImportComponent >> selectedCrops: anObject [
	selectedCrops := anObject
]

{ #category : #initialization }
FOMSenasaImportComponent >> updateSelectableCrops [
	missingRecords := self computeMissingRecords.
	selectedCropsComponent
		possibleValues:
			(((missingRecords collect: #crop) as: Set)
				asSortedCollection: [ :a :b | a vulgarName < b vulgarName ])
]
