Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMSowingComponent >> printOn: aStream [
	aStream nextPutAll: 'Siembra'
]

{ #category : #rendering }
FOMSowingComponent >> renderContentOn: html [
	html paragraph: 'Listado de siembras en order cronológico inverso'.
	html
		paragraph:
			'De cada siembra ofrecer los datos mas relevantes y en todo caso ofrecer un botón para editar'.
	html
		paragraph: 'Arriba de todo ofrecer un botán para agregar uno/a nuevo'
]
