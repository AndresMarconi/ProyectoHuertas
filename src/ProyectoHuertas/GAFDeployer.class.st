Class {
	#name : #GAFDeployer,
	#superclass : #Object,
	#instVars : [
		'adminEmail',
		'application'
	],
	#classVars : [
		'DemoMode'
	],
	#category : #'ProyectoHuertas-deployment'
}

{ #category : #demo }
GAFDeployer class >> demoMode [
	^ DemoMode ifNil: [ DemoMode := true ]
]

{ #category : #demo }
GAFDeployer class >> demoMode: aBoolean [
	DemoMode := aBoolean
]

{ #category : #deploying }
GAFDeployer >> addLibraries [
	application
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary 
]

{ #category : #accessing }
GAFDeployer >> adminEmail [
	^ adminEmail
]

{ #category : #accessing }
GAFDeployer >> adminEmail: anObject [
	adminEmail := anObject
]

{ #category : #deploying }
GAFDeployer >> deploy [
	adminEmail ifNil: [ self error: 'Missing admin email' ].
	application := WAAdmin
		register: GAFLandingComponent
		asApplicationAt: GAFLandingComponent applicationName.
	self addLibraries.
	application sessionClass: GAFSession.
	application configuration addParent: GAFConfiguration instance.
	application preferenceAt: #adminEmail put: adminEmail
]
