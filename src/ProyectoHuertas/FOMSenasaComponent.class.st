Class {
	#name : #FOMSenasaComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'selectedCrops',
		'selectedCropsComponent'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #callbacks }
FOMSenasaComponent >> importSelectedCrops [
	| existingCropNames |
	selectedCropsComponent accept.
	existingCropNames := self session crops collect: #vulgarName.
	selectedCrops
		do: [ :each | 
			(existingCropNames includes: each vulgarName)
				ifFalse: [ each save ] ]
]

{ #category : #initialization }
FOMSenasaComponent >> initialize [
	super initialize.
	selectedCropsComponent := MultipleSelectPropertyEditorComponent 
		subject: self
		selector: #selectedCrops
		label: 'Seleccione los cultivos a incluir'
		required: false.
	selectedCropsComponent
		possibleValues:
			(SenasaCatalog twentyTwenty crops
				sorted: [ :a :b | a vulgarName < b vulgarName ]);
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
						callback: [ self importSelectedCrops ];
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
