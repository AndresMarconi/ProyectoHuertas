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
FOMLoginComponent >> renderContentOn: html [
	html
		paragraph: [ html anchor
				url: self session oidcUrl;
				with: 'login' ]
]
