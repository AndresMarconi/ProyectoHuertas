"
This
	class abstracts some behaviour common to all FOM UI components such
		as having a parent , style , etc
"
Class {
	#name : #GAFAbstractComponent,
	#superclass : #WAComponent,
	#instVars : [
		'parent',
		'problems'
	],
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #'instance creation' }
GAFAbstractComponent class >> parent: aComponent [
	^ self new
		parent: aComponent;
		yourself
]

{ #category : #utility }
GAFAbstractComponent >> asCommaSeparatedList: strings [
	^ strings
		ifEmpty: [ '' ]
		ifNotEmpty: [ :col | col fold: [ :a :b | a , ', ' , b ] ]
]

{ #category : #dialogs }
GAFAbstractComponent >> confirm: message [
	^ self call: (FOMYesNoDialog message: message)
]

{ #category : #initialization }
GAFAbstractComponent >> initialize [
	super initialize.
	problems := OrderedCollection new
]

{ #category : #accessing }
GAFAbstractComponent >> parent [
	^ parent
]

{ #category : #accessing }
GAFAbstractComponent >> parent: anObject [
	parent := anObject
]

{ #category : #updating }
GAFAbstractComponent >> renderDemoStampOn: html [
	html image
		style: 'position: fixed; bottom: 30px; right: 30px; z-index: 999';
		url: GAFLibrary / #demoPng
	"		class: 'fixed-bottom';"
]

{ #category : #updating }
GAFAbstractComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #updating }
GAFAbstractComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	aWARoot
		beHtml5;
		title: 'GAP-a-Farm'.
	aWARoot stylesheet
		url:
			'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'
]
