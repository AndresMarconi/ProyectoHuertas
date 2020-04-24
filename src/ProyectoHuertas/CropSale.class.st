Class {
	#name : #CropSale,
	#superclass : #Event,
	#instVars : [
		'kilograms',
		'crop',
		'sale'
	],
	#category : #'ProyectoHuertas-model'
}

{ #category : #testing }
CropSale class >> isVoyageRoot [
	^ true
]

{ #category : #'instance creation' }
CropSale class >> product: aCrop kilograms: kg fromPlot: aPlot [
	^ self new
		crop: aCrop;
		kilograms: kg;
		plot: aPlot;
		yourself
]

{ #category : #accessing }
CropSale >> crop [
	^ crop
]

{ #category : #accessing }
CropSale >> crop: anObject [
	crop := anObject
]

{ #category : #accessing }
CropSale >> date [
	^ sale date asDate
]

{ #category : #accessing }
CropSale >> dateAndTime [
	^ sale date asDateAndTime
]

{ #category : #accessing }
CropSale >> kilograms [
	^ kilograms
]

{ #category : #accessing }
CropSale >> kilograms: anObject [
	kilograms := anObject
]

{ #category : #accessing }
CropSale >> sale [
	^ sale
]

{ #category : #accessing }
CropSale >> sale: anObject [
	sale := anObject
]

{ #category : #printing }
CropSale >> summaryFor: aSummaryRequestor [
	^ aSummaryRequestor summaryForCropSale: self
]

{ #category : #accessing }
CropSale >> time [
	^ sale date asTime
]
