Class {
	#name : #FOMExpertHomeComponent,
	#superclass : #FOMHomeComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMExpertHomeComponent >> barBrand [
	"return a string for the Bar brand"

	^ 'GAP-a-Farm (for experts)'
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
							{('Cultivos' -> FOMCropsComponent).
							('Fertilizantes y pesticidas' -> FOMSubstancesComponent).
							('Principios activos' -> FOMActiveIngredienteComponent)}
						heading: 'Catálogos'
						on: html ] ]
]
