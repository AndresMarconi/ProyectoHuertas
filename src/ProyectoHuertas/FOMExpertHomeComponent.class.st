Class {
	#name : #FOMExpertHomeComponent,
	#superclass : #FOMHomeComponent,
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #rendering }
FOMExpertHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ 'GAP-a-Farm (for experts)'
]

{ #category : #rendering }
FOMExpertHomeComponent >> dashboardComponentClass [
	^ FOMExpertDashboardComponent
]

{ #category : #rendering }
FOMExpertHomeComponent >> loadDemoData [
	TestDataLoader new
		session: self session;
		addExpertDemoData
]

{ #category : #rendering }
FOMExpertHomeComponent >> renderLeftMenuOn: html [
	html
		form: [ html
				listGroup: [ self
						renderMenuBlock:
							{('Tablero de control' -> FOMExpertDashboardComponent).
							('Difusión' -> FOMBlogAdministrationComponent)}
						heading: 'Gestión'
						on: html.
					self
						renderMenuBlock:
							{('Cultivos' -> FOMCropsComponent).
							('Principios activos' -> FOMActiveIngredientComponent).
							('Fitosanitarios y fertilizantes' -> FOMSubstancesComponent)}
						heading: 'Catálogos'
						on: html ] ]
]
