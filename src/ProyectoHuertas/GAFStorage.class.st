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
	self mongoLocal
]

{ #category : #configuration }
GAFStorage class >> mongoLocal [
	self mongoLocalAt: 'gapafarm'
]

{ #category : #configuration }
GAFStorage class >> mongoLocalAt: databaseId [
	| repository |
	repository := VOMongoRepository
		host: 'localhost'
		database: databaseId.
	repository enableSingleton
]
