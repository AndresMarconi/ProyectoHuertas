Class {
	#name : #FOMConfiguration,
	#superclass : #WASystemConfiguration,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #description }
FOMConfiguration >> describeOn: config [
	(config string: #loginApp)
		group: #Login;
		comment: 'Name of the app that authenticates users. Leave it empty to bypass authentication'
]
