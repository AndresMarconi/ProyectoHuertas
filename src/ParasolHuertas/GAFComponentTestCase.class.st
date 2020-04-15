Class {
	#name : #GAFComponentTestCase,
	#superclass : #BPParasolSelfTestCase,
	#instVars : [
		'helper'
	],
	#category : #'ParasolHuertas-tests'
}

{ #category : #elements }
GAFComponentTestCase >> acceptButton [
	^ driver findElementByID: 'accept-button'
]

{ #category : #elements }
GAFComponentTestCase >> addButton [
	^ driver findElementByID: 'add-button'
]

{ #category : #elements }
GAFComponentTestCase >> cancelButton [
	^ driver findElementByPartialLinkText: 'Cancel'
]

{ #category : #utility }
GAFComponentTestCase >> clearActiveFieldWith: email [
	email size
		timesRepeat: [ driver getKeyboard sendKeys: BPKeys backSpace asString ]
]

{ #category : #elements }
GAFComponentTestCase >> commentField [
	^ driver findElementByID: 'comment'
]

{ #category : #running }
GAFComponentTestCase >> configureTestApp: testApp [
	testApp sessionClass: TestGAFSessionForSampleUser.
	testApp
		addLibrary: JQDeploymentLibrary;
		addLibrary: JQUiDeploymentLibrary;
		addLibrary: SBSDeploymentLibrary.
	testApp configuration addParent: GAFConfiguration instance.
	testApp preferenceAt: #adminEmail put: 'casco@gmail.com'
]

{ #category : #elements }
GAFComponentTestCase >> dateField [
	^ driver findElementByID: 'date'
]

{ #category : #utility }
GAFComponentTestCase >> optionsInSelect: aSelectElement [
	^ (aSelectElement findElementsByTagName: 'option')
		collect: [ :each | each getText ]
]

{ #category : #elements }
GAFComponentTestCase >> plotSelector [
	^ driver findElementByID: 'plotSelector'
]

{ #category : #elements }
GAFComponentTestCase >> tableContent [
	^ ((driver findElementByClassName: 'table')
		findElementByTagName: 'tbody') getText
]

{ #category : #elements }
GAFComponentTestCase >> timeField [
	^ driver findElementByID: 'time'
]

{ #category : #scripts }
GAFComponentTestCase >> waitForStringToBePresent: aString [
	self
		waitUntil: [ driver getPageSource ]
		is: [ :value | value includesSubstring: aString ]
		checkEvery: (Duration milliseconds: 100)
		timeoutAfter: (Duration seconds: 5)
		with: [ nil ]
]