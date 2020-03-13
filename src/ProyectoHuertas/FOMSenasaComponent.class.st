Class {
	#name : #FOMSenasaComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'selectedCrops',
		'selectedCropsComponent',
		'missingRecords',
		'selectedRecords'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #initialization }
FOMSenasaComponent >> computeMissingRecords [
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
FOMSenasaComponent >> currentSenasaCatalogue [
	^ SenasaCatalog
		twentyTwentyWithExistingCrops: self session crops
		andExistingActiveIngredientes: self session activeIngredients
]

{ #category : #callbacks }
FOMSenasaComponent >> importRecordsForSelectedCrops [
	selectedCropsComponent accept.
	selectedRecords := missingRecords
		select: [ :each | selectedCrops includes: each crop ].
	(missingRecords select: [ :each | selectedCrops includes: each crop ])
		do: [ :record | 
			record save.
			record crop save.
			record activeIngredient addSenasaApplicabilityRecord: record. 
			record activeIngredient save ].
	self updateSelectableCrops
]

{ #category : #initialization }
FOMSenasaComponent >> initialize [
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
FOMSenasaComponent >> renderCatalogSummaryOn: html [
	html heading
		level5;
		with: 'Tolerancias de residuos de plaguicidas'.
	html
		paragraph: [ html text: 'La '.
			html anchor
				url:
					'http://www.senasa.gob.ar/normativas/resolucion-934-2010-senasa-servicio-nacional-de-sanidad-y-calidad-agroalimentaria';
				target: '_blank';
				with: 'resolución 934-2010 '.
			html
				text:
					'del SENASA establece los límites máximos de tolerancia para la presencia de los fitosanitarios.' ].
	html
		paragraph:
			'GAP-a-Farm incluye una versión actualizada (al 2020) del listado. A continuación podrá seleccionar los cultivos para los cuales desea importar la información. Solo se importan registros que no existen en el sistema (es decir, no se actualizan si ya hubiesen sido cargados)'
]

{ #category : #rendering }
FOMSenasaComponent >> renderContentOn: html [
	self renderCatalogSummaryOn: html.
	self renderImportFormOn: html
]

{ #category : #rendering }
FOMSenasaComponent >> renderImportFormOn: html [
	html
		form: [ html render: selectedCropsComponent.
			html
				paragraph: [ html formButton
						bePrimary;
						callback: [ self importRecordsForSelectedCrops ];
						with: 'Importar' ] ]
]

{ #category : #accessing }
FOMSenasaComponent >> selectedCrops [
	^ selectedCrops
]

{ #category : #accessing }
FOMSenasaComponent >> selectedCrops: anObject [
	selectedCrops := anObject
]

{ #category : #initialization }
FOMSenasaComponent >> updateSelectableCrops [
	missingRecords := self computeMissingRecords.
	selectedCropsComponent
		possibleValues:
			(((missingRecords collect: #crop) as: Set)
				asSortedCollection: [ :a :b | a vulgarName < b vulgarName ])
]
