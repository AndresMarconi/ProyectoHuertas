Class {
	#name : #FOMApplicationsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]

{ #category : #printing }
FOMApplicationsComponent >> renderContentOn: html [
	html
		paragraph: 'Listado de aplicaciones en order cronológico inverso'.
	html
		paragraph:
			'De cada aplicación ofrecer los datos mas relevantes y en todo caso ofrecer un botón para editar'.
	html
		paragraph: 'Arriba de todo ofrecer un botán para agregar uno/a nuevo'
]
