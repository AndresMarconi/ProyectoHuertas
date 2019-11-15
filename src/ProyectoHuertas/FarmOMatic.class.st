Class {
	#name : #FarmOMatic,
	#superclass : #Object,
	#instVars : [
		'users',
		'inputs',
		'products'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
FarmOMatic >> initialize [
	self withExampleUsers.
	self loadInputs.
	self loadProducts 
]

{ #category : #accessing }
FarmOMatic >> inputs [
	^ inputs
]

{ #category : #'as yet unclassified' }
FarmOMatic >> loadEvents: aPlot [
	| sowing harvest aplication problem |	
	sowing:= Sowing product: (Product name: 'tomate' variety: 'perita') 
							system: 'colgante' distribution: 'pareja' plantsQuantity: '300' date: (Date today) surface: aPlot surface.
	harvest:= Harvesting sowing: sowing quantity: 200 date: (Date tomorrow) surface: aPlot surface.
	aplication:= Application input: (Input new) dose: 2 type: 'tipo' machine: 'one' lack: 3 activeIngredient: 'anActive' date: (Date today) surface: aPlot surface.
	problem:= Problem name: 'plaga' date: (Date yesterday) surface: aPlot surface.
	aPlot addEvent: sowing;
			addEvent: problem;
			addEvent: aplication;
			addEvent: harvest.
]

{ #category : #adding }
FarmOMatic >> loadFarms: user [
	| farm1 farm2 |
	farm1:= Farm named: 'farm1'.
	farm2:= Farm named: 'farm2'.
	self loadPlots: farm1; loadPlots: farm2.
	user addFarm: farm1; addFarm: farm2.

]

{ #category : #'as yet unclassified' }
FarmOMatic >> loadInputs [
	inputs := OrderedCollection new.
	inputs add: (Input product: 'rootex' brand: 'syngenta' container: 'bottle' expires: (Date year: 2021 month: 5 day: 3) quantity: 20).
	inputs add: (Input product: 'nissorum' brand: 'syngenta' container: 'drum' expires: (Date year: 2022 month: 8 day: 10) quantity: 12).
	inputs add: (Input product: 'inicium' brand: 'brometan' container: 'box' expires: (Date year: 2021 month: 9 day: 22) quantity: 30).
	inputs add: (Input product: 'rovral' brand: 'syngenta' container: 'bottle' expires: (Date year: 2023 month: 1 day: 30) quantity: 9).
	inputs add: (Input product: 'drin' brand: 'brometan' container: 'bottle' expires: (Date year: 2021 month: 10 day: 13) quantity: 22)
]

{ #category : #adding }
FarmOMatic >> loadPlots: farm [
	| plot1 plot2 |
	plot1 := Plot id: 11 surface: 32.
	plot2 := Plot id: 12 surface: 10.
	self loadEvents: plot1; loadEvents: plot2.
	farm addPlot: plot1 ; addPlot: plot2.


]

{ #category : #'as yet unclassified' }
FarmOMatic >> loadProducts [
	products := OrderedCollection new.
	products add: (Product name: 'tomate' variety: 'perita').
	products add: (Product name: 'tomate' variety: 'redondo').
	products add: (Product name: 'lechuga' variety: 'criolla').
	products add: (Product name: 'lechuga' variety: 'romana').
	products add: (Product name: 'frutilla' variety: 'cultivada').
	products add: (Product name: 'naranja' variety: 'ombligo').
	products add: (Product name: 'naranja' variety: 'jugo')
]

{ #category : #'as yet unclassified' }
FarmOMatic >> loadUsers [
	| user1 user2 |
	users := OrderedCollection new.
	user1 := User newWithName: 'unUsuario' Name: 'unNombre' Surname: 'unApellido' Password: 'unaContraseña'.
	user2 := User newWithName: 'unUsuario2' Name: 'unNombre2' Surname: 'unApellido2' Password: 'unaContraseña2'.
	self loadFarms: user1; loadFarms: user2.
	users add: user1; add: user2
]

{ #category : #accessing }
FarmOMatic >> products [ 
	^ products 
]

{ #category : #accessing }
FarmOMatic >> users [ 
	^ users
]

{ #category : #examples }
FarmOMatic >> withExampleUsers [
	| user1 user2 |
	users := OrderedCollection new.
	user1 := User username: 'unUsuario' firstName: 'unNombre' surname: 'unApellido' password: 'unaContraseña'.
	user2 := User username: 'unUsuario2' firstName: 'unNombre2' surname: 'unApellido2' password: 'unaContraseña2'.
	self loadFarms: user1; loadFarms: user2.
	users add: user1; add: user2
]
