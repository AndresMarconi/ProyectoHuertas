Class {
	#name : #FOMVarietiesComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMVarietiesComponent >> printOn: aStream [
	aStream nextPutAll: 'Variedades'
]

{ #category : #rendering }
FOMVarietiesComponent >> renderContentOn: html [
	html
		paragraph: 'Listado de variedades en order alfabético. Si son muchas, paginar. '.
	html
		paragraph: 'Arriba de todo ofrecer un botón para agregar uno/a nuevo'.
	html
		paragraph:
			'Esto probablemente sea info compartida entre todos los usuarios cuando vayamos a la versión en red. Tal vez puedan agregar las suyas propias que quedarán marcadas como "borrador" y podrán ser utilizadas solo por ellos hasta que los administradores las lleven a la lista compartida '
]
