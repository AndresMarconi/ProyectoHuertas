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
	html heading
		level5;
		with: 'Tolerancias de residuos de plaguicidas'.
	html
		paragraph: [ html text: 'La '.
			html anchor
				url:
					'http://www.senasa.gob.ar/normativas/resolucion-934-2010-senasa-servicio-nacional-de-sanidad-y-calidad-agroalimentaria';
				target: '_blank';
				with: 'resoluci√≥n 934-2010 '.
			html
				text:
					'del SENASA establece los l√≠mites m√°ximos de tolerancia para la presencia de los fitosanitarios.' ].
	html
		paragraph:
			'GAP-a-Farm incluye una versi√≥n actualizada (al 2020) del listado. A continuaci√≥n podr√° seleccionar los cultivos para los cuales desea importar la informaci√≥n. Solo se importan registros que no existen en el sistema (es decir, no se actualizan si ya hubiesen sido cargados)'.
			html
		paragraph:
			'Se ignoran todos los productos de aplicaci√≥n post-cosecha. El excel provisto por SENASA fue modificado levemente para corregir errores tipogr√°ficos.'
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
