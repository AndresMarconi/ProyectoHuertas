Class {
	#name : #LoginComponent,
	#superclass : #FOMMainComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'ProyectoHuertas-view'
}

{ #category : #rendering }
LoginComponent >> renderContentOn: anHtmlCanvas [
	anHtmlCanvas unorderedList: [  
		(self session sistema) do: [ :user | 
			anHtmlCanvas listItem: user username.
			anHtmlCanvas unorderedList: [ 
				user farms do:[ :farm | anHtmlCanvas listItem: farm name ] ] ] ] 
	
]
