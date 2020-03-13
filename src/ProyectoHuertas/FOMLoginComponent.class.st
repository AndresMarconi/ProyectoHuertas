Class {
	#name : #FOMLoginComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'class initialization' }
FOMLoginComponent class >> applicationName [
	^ 'huertas-login'
]

{ #category : #rendering }
FOMLoginComponent >> appDescription [
	^ 'GAP-a-Farm es una aplicación minimalista, experimental, para gestionar',
	' los eventos de la granja de producción hortícola, ofreciendo',
   ' recomendaciones para a aplicación de buenas prácticas de agricultura'
]

{ #category : #rendering }
FOMLoginComponent >> renderContentOn: html [
	html paragraph: [  ].
	html
		container: [ html break.
			html
				jumbotron: [ html heading: 'GAP-a-Farm'.
					html image url: FOMLibrary / #farmomaticJpeg.
					html
						break;
						break.
					html paragraph: [ html text: self appDescription ].
					html
						paragraph: [ html anchor
								url: self session oidcUrl;
								with: [ html formButton
										bePrimary;
										beLarge;
										with: 'Ingresar' ] ] ] ]
]
