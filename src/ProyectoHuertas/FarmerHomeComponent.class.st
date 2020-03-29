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
							('Adversidades' -> ProblemsComponent).
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
						on: html ] ]
]
