Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMHarvestComponent >> printOn: aStream [
	aStream nextPutAll: 'Cosecha'
]

{ #category : #printing }
FOMHarvestComponent >> renderContentOn: html [
	html paragraph: 'Listado de cosechas en order cronológico inverso'.
	html
		paragraph:
			'De cada cosecha ofrecer los datos mas relevantes y en todo caso ofrecer un botón para editar'.
	html
		paragraph: 'Arriba de todo ofrecer un botán para agregar uno/a nuevo'
]
