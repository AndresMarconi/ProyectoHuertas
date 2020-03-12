"
Look at the class side
"
Class {
	#name : #FOMStorage,
	#superclass : #Object,
	#category : #'ProyectoHuertas-persistency'
}

{ #category : #configuration }
FOMStorage class >> inMemory [
	| repository |
	repository := VOMemoryRepository new.
	repository enableSingleton
]

{ #category : #initialization }
FOMStorage class >> initialize [
	self inMemory
]

{ #category : #configuration }
FOMStorage class >> mongoLocal [
	| repository |
	repository := VOMongoRepository host: 'localhost' database: 'gapafarm'.
	repository enableSingleton
]
