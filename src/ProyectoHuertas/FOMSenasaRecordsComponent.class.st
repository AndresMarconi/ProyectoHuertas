Class {
	#name : #FOMSenasaRecordsComponent,
	#superclass : #FOMAbstractTableWithOptionsComponent,
	#instVars : [
		'filterCrop'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMSenasaRecordsComponent >> columnHeadings [
	^ {'Principio activo' . 'Cultivo' . 'Residuos (mg/Kg)'.
	'Aptitud'}, super columnHeadings
]

{ #category : #rendering }
FOMSenasaRecordsComponent >> columnValuesFor: element [
	^ {element activeIngredient tradeName.
	element crop vulgarName.
	element residue printString.
	(self asCommaSeparatedList: element applicabilities)}, (super columnValuesFor: element)
]

{ #category : #hooks }
FOMSenasaRecordsComponent >> elementClass [
	"Returns the class of elements to edit and add"

	^ 	self notYetImplemented
]

{ #category : #accessing }
FOMSenasaRecordsComponent >> elements [
	^ self session senasaApplicabilityRecords
		select: [ :each | filterCrop isNil or: [ filterCrop = each crop ] ]
]

{ #category : #accessing }
FOMSenasaRecordsComponent >> filterCrop [
	^ filterCrop
]

{ #category : #accessing }
FOMSenasaRecordsComponent >> filterCrop: anObject [
	filterCrop := anObject
]

{ #category : #callbacks }
FOMSenasaRecordsComponent >> importRecords [
	self call: FOMSenasaImportComponent new
]

{ #category : #initialization }
FOMSenasaRecordsComponent >> initialize [
	super initialize.
	duplicateEnabled := false.
	removeEnabled := false.
	editEnabled := false.
	addEnabled := false
]

{ #category : #rendering }
FOMSenasaRecordsComponent >> renderContentOn: html [
	self renderPlotFilterOn: html.
	html break.
	html
		paragraph:
			'A continuación se listan los registros publicados por SENASA que ya han sido importados'.
	super renderContentOn: html.
	self renderImportButtonOn: html
]

{ #category : #rendering }
FOMSenasaRecordsComponent >> renderImportButtonOn: html [
	html
		paragraph: [ html anchor
				callback: [ self importRecords ];
				with: [ html formButton
						bePrimary;
						with: 'Importar' ] ]
]

{ #category : #rendering }
FOMSenasaRecordsComponent >> renderPlotFilterOn: html [
	html
		form: [ html
				row: [ html
						column: [ html select
								formControl;
								on: #filterCrop of: self;
								id: 'crop-filter';
								list: {nil} , self session crops ]
							mediumSize: 3;
						column: [ html submitButton
								class: 'btn btn-primary';
								with: 'Filtrar' ]
							mediumSize: 6 ] ]
]
