"
This
	class abstracts some behaviour common to all FOM UI components such
		as having a parent , style , etc
"
Class {
	#name : #FOMAbstractComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'problems'
	],
	#category : #'ProyectoHuertas-ui'
}

{ #category : #initialization }
FOMAbstractComponent >> initialize [
	super initialize.
	problems := OrderedCollection new
]

{ #category : #accessing }
FOMAbstractComponent >> parent [
	^ parent
]

{ #category : #accessing }
FOMAbstractComponent >> parent: anObject [
	parent := anObject
]

{ #category : #bootstrap4 }
FOMAbstractComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #updating }
FOMAbstractComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	aWARoot
		beHtml5;
		title: 'FarmOMatic'
]
