Class {
	#name : #ParasolForGAF,
	#superclass : #TestCase,
	#instVars : [
		'driver',
		'helper'
	],
	#category : #'ParasolHuertas-parasol'
}

{ #category : #scripts }
ParasolForGAF >> addPlotWithId: plotId [
	(driver findElementByID: 'addOnePlot') click.
	3 second wait.
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
	^ helper sampleEmail
]

{ #category : #constants }
ParasolForGAF >> farmerFullname [
	^ helper sampleFullname
]

{ #category : #constants }
ParasolForGAF >> farmerPassword [
	^ helper samplePassword
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
	(driver findElementByID: 'Aplicaciones') click.
]

{ #category : #scripts }
ParasolForGAF >> selectChronologyTab [
	(driver findElementByID: 'Cronología') click.
]

{ #category : #scripts }
ParasolForGAF >> selectHarvestingTab [
	(driver findElementByID: 'Cosecha') click.
]

{ #category : #scripts }
ParasolForGAF >> selectInventoryTab [
	(driver findElementByID: 'Inventario') click.
]

{ #category : #scripts }
ParasolForGAF >> selectPlotsTab [
	(driver findElementByID: 'Lotes') click.
]

{ #category : #scripts }
ParasolForGAF >> selectProblemsTab [
	(driver findElementByID: 'Adversidades') click.
]

{ #category : #scripts }
ParasolForGAF >> selectSalesTab [
	(driver findElementByID: 'Ventas') click.
]

{ #category : #scripts }
ParasolForGAF >> selectSowingTab [
	(driver findElementByID: 'PlantaciónYSiembra') click.
]

{ #category : #tests }
ParasolForGAF >> setUp [
	GAFStorage inMemory.
	helper := ParasolHelperForDataPreparation new.
	driver := BPRemoteWebDriver withCapabilities: BPChromeOptions new
]

{ #category : #shortcuts }
ParasolForGAF >> tableContent [
	^ ((driver findElementByClassName: 'table')
		findElementByTagName: 'tbody') getText
]

{ #category : #tests }
ParasolForGAF >> tearDown [
	driver quit
]

{ #category : #tests }
ParasolForGAF >> testAddPlot [
	self registerFarmer.
	self selectPlotsTab.
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
ParasolForGAF >> testLogin [
	self loginFarmer.
	self
		assert: (driver getPageSource includesSubstring: 'El usuario no existe').
	helper prepareStartUpFarm.
	self loginFarmer.
	self assert: (driver getPageSource includesSubstring: 'Eventos')
]

{ #category : #tests }
ParasolForGAF >> testRegister [
	self registerFarmer.
	self assert: (driver getPageSource includesSubstring: 'Eventos')
]
