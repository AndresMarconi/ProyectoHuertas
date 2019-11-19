Class {
	#name : #FOMSalesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMSalesComponent >> printOn: aStream [
	aStream nextPutAll: 'Ventas'
]

{ #category : #rendering }
FOMSalesComponent >> renderContentOn: html [
	html paragraph: 'Listado de ventas en order cronológico inverso'.
	html
		paragraph:
			'De cada problema venta los datos mas relevantes y en todo caso ofrecer un botón para editar'.
	html
		paragraph: 'Arriba de todo ofrecer un botán para agregar uno/a nuevo'
]
