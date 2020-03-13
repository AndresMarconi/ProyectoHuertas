Class {
	#name : #FOMSenasaComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMSenasaComponent >> renderContentOn: html [
	| rows |
	rows := (NeoCSVReader
		on: FOMLibrary new lmrsfebrero2020Csv readStream) upToEnd.
	html
		table: [ rows
				do: [ :row | html tableRow: [ row do: [ :td | html tableData: td ] ] ] ]
]
