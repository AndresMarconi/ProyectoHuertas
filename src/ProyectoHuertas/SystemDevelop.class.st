Class {
	#name : #SystemDevelop,
	#superclass : #Object,
	#instVars : [
		'users',
		'inputs',
		'products'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #initialization }
SystemDevelop >> initialize [
	self loadUsers.
	self loadInputs.
	self loadProducts 
]

{ #category : #accessing }
SystemDevelop >> inputs [
	^ inputs
]

{ #category : #'as yet unclassified' }
SystemDevelop >> loadEvents: aPlot [
	| sowing harvest aplication problem |	
	sowing:= Sowing newWithProduct: (Product newWithName: 'tomate' Variety: 'perita') 
							System: 'colgante' Distribution: 'pareja' PQ: '300' Date: (Date today) Surface: aPlot surface.
	harvest:= Harvest newWithSowing: sowing Quantity: 200 Date: (Date tomorrow) Surface: aPlot surface.
	aplication:= Aplication newWithInput: (Input new) Dose: 2 Type: 'tipo' Machine: 'one' Lack: 3 ActiveIngredient: 'anActive' Date: (Date today) Surface: aPlot surface.
	problem:= Problem newWithName: 'plaga' Date: (Date yesterday) Surface: aPlot surface.
	aPlot addEvent: sowing;
			addEvent: problem;
			addEvent: aplication;
			addEvent: harvest.
]

{ #category : #adding }
SystemDevelop >> loadFarms: user [
	| farm1 farm2 |
	farm1:= Farm newWithName: 'farm1'.
	farm2:= Farm newWithName: 'farm2'.
	self loadPlots: farm1; loadPlots: farm2.
	user addFarm: farm1; addFarm: farm2.

]

{ #category : #'as yet unclassified' }
SystemDevelop >> loadInputs [
	inputs := OrderedCollection new.
	inputs add: (Input newWithProduct: 'rootex' Brand: 'syngenta' Container: 'bottle' Expires: (Date year: 2021 month: 5 day: 3) Quantity: 20).
	inputs add: (Input newWithProduct: 'nissorum' Brand: 'syngenta' Container: 'drum' Expires: (Date year: 2022 month: 8 day: 10) Quantity: 12).
	inputs add: (Input newWithProduct: 'inicium' Brand: 'brometan' Container: 'box' Expires: (Date year: 2021 month: 9 day: 22) Quantity: 30).
	inputs add: (Input newWithProduct: 'rovral' Brand: 'syngenta' Container: 'bottle' Expires: (Date year: 2023 month: 1 day: 30) Quantity: 9).
	inputs add: (Input newWithProduct: 'drin' Brand: 'brometan' Container: 'bottle' Expires: (Date year: 2021 month: 10 day: 13) Quantity: 22)
]

{ #category : #adding }
SystemDevelop >> loadPlots: farm [
	| plot1 plot2 |
	plot1 := Plot newWithId: 11 Surface: 32.
	plot2 := Plot newWithId: 12 Surface: 10.
	self loadEvents: plot1; loadEvents: plot2.
	farm addPlot: plot1 ; addPlot: plot2.


]

{ #category : #'as yet unclassified' }
SystemDevelop >> loadProducts [
	products := OrderedCollection new.
	products add: (Product newWithName: 'tomate' Variety: 'perita').
	products add: (Product newWithName: 'tomate' Variety: 'redondo').
	products add: (Product newWithName: 'lechuga' Variety: 'criolla').
	products add: (Product newWithName: 'lechuga' Variety: 'romana').
	products add: (Product newWithName: 'frutilla' Variety: 'cultivada').
	products add: (Product newWithName: 'naranja' Variety: 'ombligo').
	products add: (Product newWithName: 'naranja' Variety: 'jugo')
]

{ #category : #'as yet unclassified' }
SystemDevelop >> loadUsers [
	| user1 user2 |
	users := OrderedCollection new.
	user1 := User newWithName: 'unUsuario' Name: 'unNombre' Surname: 'unApellido' Password: 'unaContraseña'.
	user2 := User newWithName: 'unUsuario2' Name: 'unNombre2' Surname: 'unApellido2' Password: 'unaContraseña2'.
	self loadFarms: user1; loadFarms: user2.
	users add: user1; add: user2
]

{ #category : #accessing }
SystemDevelop >> products [ 
	^ products 
]

{ #category : #accessing }
SystemDevelop >> users [ 
	^ users
]
