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
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'instance creation' }
FOMAbstractComponent class >> parent: aComponent [
	^ self new
		parent: aComponent;
		yourself
]

{ #category : #utility }
FOMAbstractComponent >> asCommaSeparatedList: strings [
	^ strings
		ifEmpty: [ '' ]
		ifNotEmpty: [ :col | col fold: [ :a :b | a , ', ' , b ] ]
]

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

{ #category : #updating }
FOMAbstractComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #updating }
FOMAbstractComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	aWARoot
		beHtml5;
		title: 'GAP-a-Farm'.
	aWARoot stylesheet
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'
]
