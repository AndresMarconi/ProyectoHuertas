Class {
	#name : #CSVProblemsExporter,
	#superclass : #CSVGAFExporter,
	#category : #'ProyectoHuertas-export'
}

{ #category : #exporting }
CSVProblemsExporter >> elementRowFor: aProblem [
	"#('Fecha' 'Hora' 'Lote' 'Tipo' 'Problema' 'Notas')"

	^ {aProblem date.
	aProblem time.
	aProblem plot id.
	aProblem name.
	aProblem type.
	aProblem comment}
]

{ #category : #exporting }
CSVProblemsExporter >> headerRow [
	^ #('Fecha' 'Hora' 'Lote' 'Tipo' 'Problema' 'Notas')
]
