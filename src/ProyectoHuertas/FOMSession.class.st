Class {
	#name : #FOMSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'sistema'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
FOMSession >> initialize [
	| user1 user2 farm1 farm2 farm3 farm4 |
	super initialize.
	sistema := OrderedCollection new.
	user1 := User newUserName: 'unUsuario' Name: 'unNombre' Surname: 'unApellido' Password: 'unaContraseña'.
	user2 := User newUserName: 'unUsuario2' Name: 'unNombre2' Surname: 'unApellido2' Password: 'unaContraseña2'.
	farm1:= Farm newFarm: 'farm1'.
	farm2:= Farm newFarm: 'farm2'.
	farm3:= Farm newFarm: 'farm3'.
	farm4:= Farm newFarm: 'farm4'.
	user1 addFarm: farm1; addFarm: farm2.
	user2 addFarm: farm3; addFarm: farm4.
	sistema add: user1; add: user2
]

{ #category : #accessing }
FOMSession >> sistema [
	^sistema
]
