Class {
	#name : #FOMSenasaComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'selectedCrops',
		'selectedCropsComponent',
		'importableCrops',
		'missingRecords',
		'selectedRecords'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #initialization }
FOMSenasaComponent >> computeImportableCrops [
	| newCrops |
	newCrops := (missingRecords collect: #crop as: Set)
		asSortedCollection: [ :a :b | a vulgarName < b vulgarName ].
	^ newCrops
		reject:
			[ :each | self session crops anySatisfy: [ :any | any vulgarName = each ] ]
]

{ #category : #initialization }
FOMSenasaComponent >> computeMissingRecords [
	| existingRecords |
	existingRecords := self session senasaApplicabilityRecords.
	^ SenasaCatalog twentyTwenty records
		reject: [ :newRecord | 
			existingRecords
				anySatisfy: [ :existingRecord | 
					existingRecord crop vulgarName = newRecord crop vulgarName
						&
							(existingRecord activeIngredient tradeName
								= newRecord activeIngredient tradeName) ] ]
]

{ #category : #callbacks }
FOMSenasaComponent >> createMissingActiveIngredients [

	| existingActiveIngredientNames  |
	existingActiveIngredientNames := self session activeIngredients  collect: #tradeName.
	selectedCrops
		do: [ :each | 
			(existingActiveIngredientNames includes: each vulgarName)
				ifFalse: [ each save ] ]
]

{ #category : #callbacks }
FOMSenasaComponent >> createMissingCrops [
	| existingCropNames |
	existingCropNames := self session crops collect: #vulgarName.
	selectedCrops
		do: [ :each | 
			(existingCropNames includes: each vulgarName)
				ifFalse: [ each save ] ]
]

{ #category : #callbacks }
FOMSenasaComponent >> importRecordsForSelectedCrops [
	selectedCropsComponent accept.
	selectedRecords := missingRecords select: [ :each | selectedCrops includes: each crop  ].
	self createMissingCrops.
	self createMissingActiveIngredients.
	(missingRecords select: [ :each | selectedCrops includes: each crop ])
		do: #save
]

{ #category : #initialization }
FOMSenasaComponent >> initialize [
	super initialize.
	missingRecords := self computeMissingRecords.
	importableCrops := self computeImportableCrops.
	selectedCropsComponent := MultipleSelectPropertyEditorComponent
		subject: self
		selector: #selectedCrops
		label: 'Seleccione los cultivos a incluir'
		required: false.
	selectedCropsComponent
		possibleValues: importableCrops;
		rows: 20
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
