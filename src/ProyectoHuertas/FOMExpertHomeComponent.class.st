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
							{('Tablero de control' -> self dashboardComponentClass).
							('Cultivos' -> FOMCropsComponent).
							('Fitosanitarios y fertilizantes' -> FOMSubstancesComponent).
							('Principios activos' -> FOMActiveIngredientComponent)}
						heading: 'Catálogos'
						on: html ] ]
]
