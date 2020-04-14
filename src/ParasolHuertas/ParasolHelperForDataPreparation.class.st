Class {
	#name : #ParasolHelperForDataPreparation,
	#superclass : #Object,
	#instVars : [
		'user'
	],
	#category : #'ParasolHuertas-parasol'
}

{ #category : #scripts }
ParasolHelperForDataPreparation >> prepareStartUpFarm [
	user := self sampleUser save.
	self sampleCrops do: #save.
	user addFarm: (Farm name: 'Granja de ' , user fullname) save.
	user farms first
		addPlot: (Plot id: 'Lote 1' surface: 1000) save;
		addPlot: (Plot id: 'Lote 2' surface: 1000) save.
	user farms first save
]

{ #category : #'factory-methods' }
ParasolHelperForDataPreparation >> sampleCrops [
	^ {'Tomate' . 'Pimiento' . 'Pepino'}
		collect: [ :each | Crop name: each yield: 1 ]
]

{ #category : #'factory-methods' }
ParasolHelperForDataPreparation >> sampleEmail [
	^ 'john@gmail.com'
]

{ #category : #'factory-methods' }
ParasolHelperForDataPreparation >> sampleFullname [
	^ 'John Doe'
]

{ #category : #'factory-methods' }
ParasolHelperForDataPreparation >> sampleIngrediente [
	^ {'Tomate' . 'Pimiento' . 'Pepino'}
		collect: [ :each | Crop name: each yield: 1 ]
]

{ #category : #'factory-methods' }
ParasolHelperForDataPreparation >> samplePassword [
	^ 'password'
]

{ #category : #'factory-methods' }
ParasolHelperForDataPreparation >> sampleUser [
	^ (GAFUser email: self sampleEmail fullname: self sampleFullname)
		hashedPassword:
			(SHA256 new hashMessage:
				self samplePassword asByteArray) asString;
		yourself
]

{ #category : #accessing }
ParasolHelperForDataPreparation >> user [
	^ user
]

{ #category : #accessing }
ParasolHelperForDataPreparation >> user: anObject [
	user := anObject
]
