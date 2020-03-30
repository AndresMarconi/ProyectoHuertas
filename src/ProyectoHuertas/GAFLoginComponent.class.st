Class {
	#name : #GAFLoginComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'class initialization' }
GAFLoginComponent class >> applicationName [
	^ 'huertas-login'
]

{ #category : #rendering }
GAFLoginComponent >> appDescription [
	^ 'GAP-a-Farm es una aplicación minimalista, experimental, para gestionar',
	' los eventos de la granja de producción hortícola, ofreciendo',
   ' recomendaciones para a aplicación de buenas prácticas de agricultura'
]

{ #category : #rendering }
GAFLoginComponent >> renderContentOn: html [
	html paragraph: [  ].
	html
		container: [ html break.
			html
				jumbotron: [ html
						heading: [ html text: 'GAP-a-Farm'.
							(self requestContext request url printString
								includesSubstring: 'expert')
								ifTrue: [ html strong: ' (para expertos!)' ] ].
					html image url: GAFLibrary / #farmomaticJpeg.
					html
						break;
						break.
					html paragraph: [ html text: self appDescription ] ] ]
]
