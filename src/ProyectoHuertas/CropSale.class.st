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

{ #category : #'instance creation' }
CropSale class >> product: aProduct kilograms: kg fromPlot: aPlot [
	^ self new
		product: aProduct;
		kilograms: kg;
		plot: aPlot;
		yourself
]

{ #category : #accessing }
CropSale class >> typeDescriptor [
	^ 'Venta'
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
