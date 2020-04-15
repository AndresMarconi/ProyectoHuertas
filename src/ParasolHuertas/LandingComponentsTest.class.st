Class {
	#name : #LandingComponentsTest,
	#superclass : #GAFComponentTestCase,
	#category : #'ParasolHuertas-tests'
}

{ #category : #running }
LandingComponentsTest >> componentClass [
	^ GAFLandingComponent
]

{ #category : #scripts }
LandingComponentsTest >> loginFarmer [
	(driver findElementByID: 'email') click.
	self clearActiveFieldWith: helper sampleEmail.
	driver getKeyboard sendKeys: helper sampleEmail.
	(driver findElementByID: 'password') click.
	self clearActiveFieldWith: helper samplePassword.
	driver getKeyboard sendKeys: helper samplePassword.
	(driver findElementByID: 'login') click
]

{ #category : #scripts }
LandingComponentsTest >> registerFarmer [
	(driver findElementByPartialLinkText: 'registrarse') click.
	(driver findElementByID: 'fullname') click.
	driver getKeyboard sendKeys: helper sampleFullname.
	(driver findElementByID: 'email') click.
	driver getKeyboard sendKeys: helper sampleEmail.
	(driver findElementByID: 'repeatEmail') click.
	driver getKeyboard sendKeys: helper sampleEmail.
	(driver findElementByID: 'password') click.
	driver getKeyboard sendKeys: helper samplePassword.
	(driver findElementByID: 'login') click
]

{ #category : #running }
LandingComponentsTest >> setUp [
	GAFStorage inMemory.
	helper := ParasolHelperForDataPreparation new.
	super setUp
]

{ #category : #tests }
LandingComponentsTest >> testLogin [
	| user |
	self loginFarmer.
	self
		assert: (driver getPageSource includesSubstring: 'El usuario no existe').
	user := helper sampleUser.
	user addFarm: (Farm name: 'test') save.
	user save.
	self loginFarmer.
	self assert: (driver getPageSource includesSubstring: 'Eventos')
]

{ #category : #tests }
LandingComponentsTest >> testRegister [
	self registerFarmer.
	self assert: (driver getPageSource includesSubstring: 'Eventos')
]
