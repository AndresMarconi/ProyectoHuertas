"
Look at the class side
"
Class {
	#name : #GAFStorage,
	#superclass : #Object,
	#category : #'ProyectoHuertas-persistency'
}

{ #category : #configuration }
GAFStorage class >> inMemory [
	| repository |
	repository := VOMemoryRepository new.
	repository enableSingleton
]

{ #category : #initialization }
GAFStorage class >> initialize [
	self inMemory
]

{ #category : #configuration }
GAFStorage class >> mongoLocal [
	| repository |
	repository := VOMongoRepository host: 'localhost' database: 'gapafarm'.
	repository enableSingleton
]
