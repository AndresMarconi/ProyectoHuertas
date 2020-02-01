Class {
	#name : #FOMLoginComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #'class initialization' }
FOMLoginComponent class >> applicationName [
	^ 'huertas-login'
]

{ #category : #rendering }
FOMLoginComponent >> appDescription [
	^ 'Farm-o-matic es una aplicación minimalista, experimental, para gestionar',
	' los eventos de la granja de producción hortícola, ofreciendo',
   ' recomendaciones para a aplicación de buenas prácticas de agricultura'
]

{ #category : #rendering }
FOMLoginComponent >> renderContentOn: html [
	html paragraph: [  ].
	html
		container: [ html break.
			html
				jumbotron: [ html heading: 'Farm-o-matic'.
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
