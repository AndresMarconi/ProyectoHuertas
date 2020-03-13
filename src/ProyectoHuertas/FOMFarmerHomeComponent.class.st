Class {
	#name : #FOMFarmerHomeComponent,
	#superclass : #FOMHomeComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMFarmerHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ 'GAP-a-Farm (for Farmers)'
]

{ #category : #rendering }
FOMFarmerHomeComponent >> dashboardComponentClass [
	^ FOMFarmerDashboardComponent
]

{ #category : #rendering }
FOMFarmerHomeComponent >> loadDemoData [
	TestDataLoader new
		session: self session;
		addFarmerDemoData
]

{ #category : #rendering }
FOMFarmerHomeComponent >> renderLeftMenuOn: html [
	html
		form: [ html
				listGroup: [ self
						renderMenuBlock:
							{('Tablero de control' -> self dashboardComponentClass).
							('Plantación y siembra' -> FOMSowingComponent).
							('Adversidades' -> FOMProblemsComponent).
							('Aplicaciones' -> FOMApplicationsComponent).
							('Cosecha' -> FOMHarvestComponent).
							('Cronología' -> FOMEventsChronologyComponent)}
						heading: 'Eventos'
						on: html.
					self
						renderMenuBlock:
							{('Lotes' -> FOMPlotsManagementComponent).
							('Inventario' -> FOMInventoryComponent).
							('Ventas' -> FOMSalesComponent)}
						heading: 'Administración'
						on: html ] ]
]
