Class {
	#name : #ExpertExportComponent,
	#superclass : #ExportComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #callbacks }
ExpertExportComponent >> exportSubstances [
	self
		export:
			(CSVSubstancesExporter events: self session gapAFarm substances)
				export
		inFileNamed: 'fitosanitarios-y-fertilizantes.csv'
]

{ #category : #rendering }
ExpertExportComponent >> renderContentOn: html [
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Información';
						tableHeading: 'Formatos disponibles' ].
			html
				tableBody: [ html
						tableRow: [ self
								renderExportCsvButonFor: #exportSubstances
								labeled: 'Fitosanitarios y fertilizantes'
								on: html ] ] ]
]
