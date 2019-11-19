Class {
	#name : #FOMProblemsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMProblemsComponent >> printOn: aStream [
	aStream nextPutAll: 'Problemas'
]

{ #category : #rendering }
FOMProblemsComponent >> renderContentOn: html [
	html paragraph: 'Listado de problemas en order cronológico inverso'.
	html
		paragraph:
			'De cada problema ofrecer los datos mas relevantes y en todo caso ofrecer un botón para editar'.
	html
		paragraph: 'Arriba de todo ofrecer un botán para agregar uno/a nuevo'
]
