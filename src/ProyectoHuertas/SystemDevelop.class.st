Class {
	#name : #SystemDevelop,
	#superclass : #Object,
	#instVars : [
		'users'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
SystemDevelop >> initialize [
	| user1 user2 |
	users := OrderedCollection new.
	user1 := User newWithName: 'unUsuario' Name: 'unNombre' Surname: 'unApellido' Password: 'unaContraseña'.
	user2 := User newWithName: 'unUsuario2' Name: 'unNombre2' Surname: 'unApellido2' Password: 'unaContraseña2'.
	self loadFarms: user1; loadFarms: user2.
	users add: user1; add: user2
]

{ #category : #adding }
SystemDevelop >> loadFarms: user [
	| farm1 farm2 |
	farm1:= Farm newWithName: 'farm1'.
	farm2:= Farm newWithName: 'farm2'.
	self loadPlots: farm1; loadPlots: farm2.
	user addFarm: farm1; addFarm: farm2.

]

{ #category : #adding }
SystemDevelop >> loadPlots: farm [
	| plot1 plot2 |
	
	plot1 := Plot newWithId: 11 Surface: 32.
	plot2 := Plot newWithId: 12 Surface: 10.
	
	farm addPlot: plot1 ; addPlot: plot2.


]

{ #category : #accessing }
SystemDevelop >> users [ 
	^ users
]
