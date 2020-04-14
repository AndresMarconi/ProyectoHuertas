Class {
	#name : #ParasolForGAF,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'ParasolHuertas-parasol'
}

{ #category : #tests }
ParasolForGAF >> homeUrl [
	^ 'http://localhost:8080/gaf'
]

{ #category : #tests }
ParasolForGAF >> setUp [
	driver := BPRemoteWebDriver withCapabilities: BPChromeOptions new.

]

{ #category : #tests }
ParasolForGAF >> tearDown [ 
	driver quit.

]

{ #category : #tests }
ParasolForGAF >> testRegister [
	driver get: self homeUrl.
	(driver findElementByID: 'email') click.
	driver getKeyboard sendKeys: 'testuser@gmail.com'.
	(driver findElementByID: 'password') click.
	driver getKeyboard sendKeys: 'password'.
	(driver findElementByID: 'login') click.
   self assert: (driver getPageSource includesSubstring: 'El usuario no existe').
   (driver findElementByPartialLinkText: 'registrarse') click.
	(driver findElementByID: 'fullname') click.
	driver getKeyboard sendKeys: 'testuser'.
	(driver findElementByID: 'email') click.
	driver getKeyboard sendKeys: 'testuser@gmail.com'.
	(driver findElementByID: 'repeatEmail') click.
	driver getKeyboard sendKeys: 'testuser@gmail.com'.
	(driver findElementByID: 'password') click.
	driver getKeyboard sendKeys: 'password'.
	(driver findElementByID: 'login') click.
   self assert: (driver getPageSource includesSubstring: 'Eventos').
	

]
