Class {
	#name : #FOMActiveIngredientViewer,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'activeIngredient'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #accessing }
FOMActiveIngredientViewer >> activeIngredient [
	^ activeIngredient
]

{ #category : #accessing }
FOMActiveIngredientViewer >> activeIngredient: anObject [
	activeIngredient := anObject
]

{ #category : #rendering }
FOMActiveIngredientViewer >> renderContentOn: html [
	html heading
		level5;
		with: 'Principio activo'.
	html paragraph: activeIngredient tradeName.
	html heading
		level5;
		with: 'Aptitud'.
	html
		paragraph:
			(self
				asCommaSeparatedList:
					(SenasaCatalogue singleton
						combinedApplicabilitiesFor: {activeIngredient})).
	activeIngredient comment
		ifNotEmpty: [ :it | 
			html heading
				level5;
				with: 'Notes'.
			html paragraph: it ].
	html heading
		level5;
		with: 'Cultivos registrados'.
	html table
		class: 'table table-hover';
		with: [ html
				tableHead: [ html
						tableHeading: 'Cultivo';
						tableHeading: 'Residuo';
						tableHeading: 'Fuente' ].
			html
				tableBody: [ (SenasaCatalogue singleton
						recordsForActiveIngredientNamed: activeIngredient tradeName)
						do: [ :record | 
							html
								tableRow: [ html
										tableData: record cropVulgarName;
										tableData: (record residue ifNil: [ 'Exento' ]);
										tableData: record source ] ] ] ]
]
