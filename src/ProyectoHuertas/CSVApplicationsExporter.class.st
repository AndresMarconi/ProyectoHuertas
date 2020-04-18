Class {
	#name : #CSVApplicationsExporter,
	#superclass : #CSVGAFExporter,
	#category : #'ProyectoHuertas-export'
}

{ #category : #exporting }
CSVApplicationsExporter >> elementRowFor: anApplication [
	^ {anApplication date.
	anApplication time.
	anApplication plot id.
	anApplication substance comercialName.
	anApplication quantity.
	anApplication dose.
	anApplication machine.
	anApplication comment}
]

{ #category : #exporting }
CSVApplicationsExporter >> headerRow [
	^ #('Fecha' 'Hora' 'Lote' 'Producto' 'Cantidad' 'Dosificación' 'Maquina' 'Notas')
]
