Class {
	#name : #ParasolForGAF,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'ParasolHuertas-parasol'
}

{ #category : #scripts }
ParasolForGAF >> addPlotWithId: plotId [
	(driver findElementByPartialLinkText: 'uno') click.
	(driver findElementByID: 'id') click.
	driver getKeyboard sendKeys: plotId.
	(driver findElementByID: 'surface') click.
	driver getKeyboard sendKeys: '1000'.
	self clickAcceptButton
]

{ #category : #scripts }
ParasolForGAF >> clickAcceptButton [
	(driver findElementByID: 'accept-button') click
]

{ #category : #scripts }
ParasolForGAF >> clickAddButton [
	(driver findElementByID: 'add-button') click
]

{ #category : #scripts }
ParasolForGAF >> clickCancelButton [
	(driver findElementByPartialLinkText: 'Cancel') click.
]

{ #category : #accessing }
ParasolForGAF >> driver [
	^ driver
]

{ #category : #constants }
ParasolForGAF >> farmerEmail [
	^ 'testuser@gmail.com'
]

{ #category : #constants }
ParasolForGAF >> farmerFullname [
	^ 'testuser'
]

{ #category : #constants }
ParasolForGAF >> farmerPassword [
	^ 'password'
]

{ #category : #constants }
ParasolForGAF >> homeUrl [
	^ 'http://localhost:8080/gaf'
]

{ #category : #scripts }
ParasolForGAF >> loginFarmer [
	driver get: self homeUrl.
	(driver findElementByID: 'email') click.
	driver getKeyboard sendKeys: self farmerEmail.
	(driver findElementByID: 'password') click.
	driver getKeyboard sendKeys: self farmerPassword.
	(driver findElementByID: 'login') click
]

{ #category : #scripts }
ParasolForGAF >> registerFarmer [
	driver get: self homeUrl.
	(driver findElementByPartialLinkText: 'registrarse') click.
	(driver findElementByID: 'fullname') click.
	driver getKeyboard sendKeys: self farmerFullname.
	(driver findElementByID: 'email') click.
	driver getKeyboard sendKeys: self farmerEmail.
	(driver findElementByID: 'repeatEmail') click.
	driver getKeyboard sendKeys: self farmerEmail.
	(driver findElementByID: 'password') click.
	driver getKeyboard sendKeys: self farmerPassword.
	(driver findElementByID: 'login') click
]

{ #category : #scripts }
ParasolForGAF >> selectApplicationsTab [
	(driver findElementByPartialLinkText: 'Aplicaciones') click.
]

{ #category : #scripts }
ParasolForGAF >> selectChronologyTab [
	(driver findElementByPartialLinkText: 'Cronolog') click.
]

{ #category : #scripts }
ParasolForGAF >> selectHarvestingTab [
	(driver findElementByPartialLinkText: 'Cosecha') click.
]

{ #category : #scripts }
ParasolForGAF >> selectInventoryTab [
	(driver findElementByPartialLinkText: 'Inventa') click.
]

{ #category : #scripts }
ParasolForGAF >> selectPlotsTab [
	(driver findElementByPartialLinkText: 'Lotes') click.
]

{ #category : #scripts }
ParasolForGAF >> selectProblemsTab [
	(driver findElementByPartialLinkText: 'Adversidades') click.
]

{ #category : #scripts }
ParasolForGAF >> selectSalesTab [
	(driver findElementByPartialLinkText: 'Venta') click.
]

{ #category : #scripts }
ParasolForGAF >> selectSowingTab [
	(driver findElementByPartialLinkText: 'Plantac') click.
]

{ #category : #tests }
ParasolForGAF >> setUp [
   GAFStorage inMemory .
	driver := BPRemoteWebDriver withCapabilities: BPChromeOptions new.

]

{ #category : #shortcuts }
ParasolForGAF >> tableContent [
	^ ((driver findElementByClassName: 'table')
		findElementByTagName: 'tbody') getText
]

{ #category : #tests }
ParasolForGAF >> tearDown [ 
	driver quit.

]

{ #category : #tests }
ParasolForGAF >> testAddPlot [
	self registerFarmer.
	self selectPlotsTab.
	1000 milliSeconds wait.
	self addPlotWithId: 'Lote 1'.
	self assert: self tableContent equals: 'Lote 1 1000'
]

{ #category : #tests }
ParasolForGAF >> testBrandNewLanding [
	self registerFarmer.
	self selectSowingTab.
	self assert: self tableContent isEmpty.
	self selectProblemsTab.
	self assert: self tableContent isEmpty.
	self selectApplicationsTab.
	self assert: self tableContent isEmpty.
	self selectHarvestingTab.
	self assert: self tableContent isEmpty.
	self selectChronologyTab.
	self assert: self tableContent isEmpty.
	self selectPlotsTab.
	self assert: self tableContent isEmpty.
	self selectInventoryTab.
	self assert: self tableContent isEmpty.
	self selectSalesTab.
	self assert: self tableContent isEmpty
]

{ #category : #tests }
ParasolForGAF >> testRegister [
	self loginFarmer.
	self
		assert: (driver getPageSource includesSubstring: 'El usuario no existe').
	self registerFarmer.
	self assert: (driver getPageSource includesSubstring: 'Eventos')
]
