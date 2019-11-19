Class {
	#name : #FOMStockComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMStockComponent >> printOn: aStream [
	aStream nextPutAll: 'Depósito'
]

{ #category : #rendering }
FOMStockComponent >> renderContentOn: html [
	html
		paragraph:
			'Listado de los insumos (substancias, etc.) en stock. Tal ves se pueden utilizar cards para esto dado que no deberían ser muchos'.
	html paragraph: 'Pensar como lo vamos a manejar'
]
