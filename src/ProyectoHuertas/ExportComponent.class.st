Class {
	#name : #ExportComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #private }
ExportComponent >> export: data inFileNamed: aFileName [
	self requestContext
		respond: [ :response | 
			response
				contentType: WAMimeType applicationJson;
				document: data;
				attachmentWithFileName: aFileName ]
]

{ #category : #rendering }
ExportComponent >> renderExportCsvButonFor: selector labeled: label on: html [
	html
		tableData: label;
		tableData: [ html anchor
				callback: [ self perform: selector ];
				with: [ html image url: GAFLibrary / #csvicon48Jpg ] ]
]
