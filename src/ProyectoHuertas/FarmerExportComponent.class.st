Class {
	#name : #FarmerExportComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #private }
FarmerExportComponent >> export: data inFileNamed: aFileName [
	self requestContext
		respond: [ :response | 
			response
				contentType: WAMimeType applicationJson;
				document: data;
				attachmentWithFileName: aFileName ]
]

{ #category : #private }
FarmerExportComponent >> exportApplications [
	self
		export: (CSVApplicationsExporter events: self session farm aplications) export
		inFileNamed: 'aplicaciones.csv'
]

{ #category : #private }
FarmerExportComponent >> exportHarvestings [
	self
		export:
			(CSVHarverstingsExporter events: self session farm harvestings) export
		inFileNamed: 'cosechas.csv'
]

{ #category : #private }
FarmerExportComponent >> exportProblems [
	self
		export: (CSVProblemsExporter events: self session farm problems) export
		inFileNamed: 'adversidades.csv'
]

{ #category : #private }
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

{ #category : #rendering }
FarmerExportComponent >> renderExportCsvButonFor: selector labeled: label on: html [
	html
		tableData: label;
		tableData: [ html anchor
				callback: [ self perform: selector ];
				with: [ html image url: GAFLibrary / #csvicon48Jpg ] ]
]
