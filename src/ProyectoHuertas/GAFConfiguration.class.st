Class {
	#name : #GAFConfiguration,
	#superclass : #WASystemConfiguration,
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #description }
GAFConfiguration >> describeOn: config [
	(config string: #loginApp)
		group: #Login;
		comment:
			'Name of the app that authenticates users. Leave it empty to bypass authentication'.
	(config string: #adminEmail)
		group: #Login;
		comment: 'Email address of a user to be considered as admin if necessary'
]
