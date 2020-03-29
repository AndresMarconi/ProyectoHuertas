Class {
	#name : #CSVApplicationsExporter,
	#superclass : #CSVEventsExporter,
	#category : #'ProyectoHuertas-export'
}

{ #category : #exporting }
CSVApplicationsExporter >> elementRowFor: anApplication [
	^ {anApplication date.
	anApplication time.
	anApplication plot id.
	anApplication reason.
	anApplication substance comercialName.
	anApplication quantity.
	anApplication dose.
	anApplication machine.
	anApplication comment}
]

{ #category : #exporting }
CSVApplicationsExporter >> headerRow [
	^ #('Fecha' 'Hora' 'Lote' 'Razón' 'Producto' 'Cantidad' 'Dosificación' 'Maquina' 'Notas')
]
