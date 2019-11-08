Class {
	#name : #FOMMainComponent,
	#superclass : #WAComponent,
	#category : #'ProyectoHuertas-view'
}

{ #category : #updating }
FOMMainComponent >> updateRoot: arg1 [
	super updateRoot: arg1.
	arg1
		beHtml5;
		title: 'FarmOMatic'
]
