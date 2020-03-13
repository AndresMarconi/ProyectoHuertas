Class {
	#name : #FOMSenasaComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'wizardStep',
		'senasaCatalog'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #initialization }
FOMSenasaComponent >> initialize [
	super initialize.
	wizardStep := #start.
	
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
	wizardStep = #start
		ifTrue: [ ^ self renderCatalogSummaryOn: html ]
]
