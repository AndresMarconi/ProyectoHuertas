Class {
	#name : #FarmerHomeComponent,
	#superclass : #GAFHomeComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FarmerHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ 'GAP-a-Farm (para agricultores)'
]

{ #category : #rendering }
FarmerHomeComponent >> dashboardComponentClass [
	^ FarmerDashboardComponent
]

{ #category : #rendering }
FarmerHomeComponent >> loadDashboardShowcaseDemoData [
	ExampleDataLoaderToShowcaseTheDashboard new
		session: self session;
		addFarmerDemoData
]

{ #category : #rendering }
FarmerHomeComponent >> loadStressTestDemoData [
	ExampleDataLoaderToStressTest new
		session: self session;
		addFarmerDemoData
]

{ #category : #rendering }
FarmerHomeComponent >> renderLeftMenuOn: html [
	html
		form: [ html
				listGroup: [ self
						renderMenuBlock:
							{('Tablero de control' -> self dashboardComponentClass).
							('Plantación y siembra' -> SowingComponent).
							('Adversidades' -> AdversityReportsComponent).
							('Aplicaciones' -> ApplicationsComponent).
							('Cosecha' -> HarvestComponent).
							('Cronología' -> EventsChronologyComponent)}
						heading: 'Eventos'
						on: html.
					self
						renderMenuBlock:
							{('Lotes' -> PlotsManagementComponent).
							('Inventario' -> InventoryComponent).
							('Ventas' -> SalesComponent).
							('Exportar' -> FarmerExportComponent)}
						heading: 'Administración'
						on: html.
					self renderRolesMenuBlockOn: html ] ]
]

{ #category : #rendering }
FarmerHomeComponent >> renderRolesMenuBlockOn: html [
	| roles |
	roles := OrderedCollection new.
	self session user isExpert
		ifTrue: [ roles add: 'Experto' -> [ self call: ExpertHomeComponent new ] ].
	self session user isAdmin
		ifTrue: [ roles add: 'Administrador' -> [ self call: GAFAdminComponent new ] ].
	roles ifEmpty: [ ^ self ].
	html div
		class: 'left-menu-heading';
		with: 'Otros roles'.
	roles
		do: [ :ass | 
			html listGroupLinkedItem
				callback: ass value;
				with: ass key ]
]
