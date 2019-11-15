Class {
	#name : #FOMMainComponent,
	#superclass : #WAComponent,
	#category : #'ProyectoHuertas-ui'
}

{ #category : #updating }
FOMMainComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	aWARoot
		beHtml5;
		title: 'FarmOMatic'
]
