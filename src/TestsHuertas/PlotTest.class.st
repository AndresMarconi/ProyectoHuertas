Class {
	#name : #PlotTest,
	#superclass : #HuertasTestCase,
	#instVars : [
		'plot',
		'sowing'
	],
	#category : #'TestsHuertas-tests'
}

{ #category : #testing }
PlotTest >> setUp [
	plot := Plot id: 'a' surface: 1.
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

{ #category : #testing }
PlotTest >> testAddEvent [
	self assert: plot events isEmpty.
	self assert: sowing plot isNil.
	plot
		addEvent:
			(sowing
				dateAndTime: DateAndTime now;
				crop: potato;
				yourself).
	self assert: (plot events includes: sowing).
	self assert: sowing plot equals: plot
]

{ #category : #testing }
PlotTest >> testCropAtDateAndTime [
	self assert: plot events isEmpty.
	self assert: (plot cropAtDateAndTime: DateAndTime now) isNil.
	plot
		addEvent: self potatoSowingFirstOfFebruary;
		addEvent: self lettuceSowingFirstOfMarch.
	self
		assert: (plot cropAtDateAndTime: '1/15/2020' asDateAndTime) isNil.
	self
		assert: (plot cropAtDateAndTime: '2/15/2020' asDateAndTime)
		equals: potato.
	self
		assert: (plot cropAtDateAndTime: '3/15/2020' asDateAndTime)
		equals: lettuce
]
