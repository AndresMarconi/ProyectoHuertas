Class {
	#name : #FarmerExportComponent,
	#superclass : #ExportComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #callbacks }
FarmerExportComponent >> exportApplications [
	self
		export: (CSVApplicationsExporter events: self session farm aplications) export
		inFileNamed: 'aplicaciones.csv'
]

{ #category : #callbacks }
FarmerExportComponent >> exportHarvestings [
	self
		export:
			(CSVHarverstingsExporter events: self session farm harvestings) export
		inFileNamed: 'cosechas.csv'
]

{ #category : #callbacks }
FarmerExportComponent >> exportProblems [
	self
		export: (CSVProblemsExporter events: self session farm problems) export
		inFileNamed: 'adversidades.csv'
]

{ #category : #callbacks }
FarmerExportComponent >> exportSowings [
	self
		export: (CSVSowingsExporter events: self session farm sowings) export
		inFileNamed: 'siembras.csv'
]

{ #category : #rendering }
FarmerExportComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Información';
						tableHeading: 'Formatos disponibles' ].
			html
				tableBody: [ html
						tableRow: [ self
								renderExportCsvButonFor: #exportSowings
								labeled: 'Siembras'
								on: html ];
						tableRow: [ self
								renderExportCsvButonFor: #exportProblems
								labeled: 'Adversidades'
								on: html ];
						tableRow: [ self
								renderExportCsvButonFor: #exportApplications
								labeled: 'Aplicaciones'
								on: html ];
						tableRow: [ self
								renderExportCsvButonFor: #exportHarvestings
								labeled: 'Cosechas'
								on: html ] ] ]
]
