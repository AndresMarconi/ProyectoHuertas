Class {
	#name : #GAFConfiguration,
	#superclass : #WASystemConfiguration,
	#category : #'ProyectoHuertas-deployment'
}

{ #category : #description }
GAFConfiguration >> describeOn: config [
	(config string: #adminEmail)
		group: #Login;
		comment: 'Email address of a user to be considered as admin if necessary'
]
