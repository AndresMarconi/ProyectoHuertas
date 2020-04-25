Class {
	#name : #ApplicationTest,
	#superclass : #TestCase,
	#instVars : [
		'plot',
		'sowing',
		'application',
		'tomato',
		'potato'
	],
	#category : #'TestsHuertas-tests'
}

{ #category : #testing }
ApplicationTest >> setUp [
	application := Application new.
	plot := Plot id: 'a' surface: 1.
	tomato := Crop name: 'Tomate' yield: 1.
	potato := Crop name: 'Papa' yield: 1.
	sowing := Sowing
		date: Date today
		time: Time now
		plot: nil
		crop: nil
		quantity: 1
		timeToHarvest: 1
		harvestDuration: 1
		expectedYield: 1
]

{ #category : #tests }
ApplicationTest >> testCurrentCrop [
	self assert: plot currentCrop isNil.
	sowing crop: tomato.
	plot addEvent: sowing.
	self assert: plot currentCrop equals: tomato
]

{ #category : #testing }
ApplicationTest >> testPlot [
	self assert: application
]
