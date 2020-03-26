Class {
	#name : #ExpertHomeComponent,
	#superclass : #GAFHomeComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
ExpertHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ 'GAP-a-Farm (for experts)'
]

{ #category : #rendering }
ExpertHomeComponent >> dashboardComponentClass [
	^ ExpertDashboardComponent
]

{ #category : #rendering }
ExpertHomeComponent >> loadDashboardShowcaseDemoData [
	ExampleDataLoaderToShowcaseTheDashboard new
		session: self session;
		addExpertDemoData
]

{ #category : #rendering }
ExpertHomeComponent >> loadStressTestDemoData [
	ExampleDataLoaderToStressTest new
		session: self session;
		addExpertDemoData
]

{ #category : #rendering }
ExpertHomeComponent >> renderLeftMenuOn: html [
	html
		form: [ html
				listGroup: [ self
						renderMenuBlock:
							{('Tablero de control' -> ExpertDashboardComponent).
							('Noticias' -> BlogAdministrationComponent)}
						heading: 'Gestión'
						on: html.
					self
						renderMenuBlock:
							{('Cultivos' -> CropsComponent).
							('Principios activos' -> ActiveIngredientComponent).
							('Fitosanitarios y fertilizantes' -> SubstancesComponent)}
						heading: 'Catálogos'
						on: html ] ]
]
