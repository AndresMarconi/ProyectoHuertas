Class {
	#name : #FOMVoyageExampleLoader,
	#superclass : #Object,
	#instVars : [
		'jgomez',
		'mlopez'
	],
	#category : #'ProyectoHuertas-example-data'
}

{ #category : #loading }
FOMVoyageExampleLoader >> ensureRepository [
	"check if there is a repository set for any of the persistent classes, if not, use one in memory"

	User voyageRepository ifNil: [ FOMStorage inMemory ]
]

{ #category : #loading }
FOMVoyageExampleLoader >> load [
	self
		ensureRepository;
		loadVarieties;
		loadUsers;
		loadFarms;
		loadSubstances;
		loadPlots;
		loadEvents
]

{ #category : #legacy }
FOMVoyageExampleLoader >> loadEvents [
	| sowing harvest problem application |
	Plot selectAll
		do: [ :plot | 
			Variety selectAll
				do: [ :variety | 
					sowing := Sowing
						conductionSystem: 'Colgante'
						quantity: 300
						distribution: 'Pareja'
						variety: variety
						date: Date today
						surface: plot surface.
					sowing save.
					plot addEvent: sowing.
					harvest := Harvesting
						variety: variety
						quantity: 200
						date: Date tomorrow.
					harvest save.
					plot addEvent: harvest ].
			problem := Problem
				name: 'plaga'
				date: Date yesterday
				surface: plot surface.
			plot addEvent: problem.
			Substance selectAll
				do: [ :substance | 
					application := Application
						substance: substance
						dose: 10
						machine: 'one'
						date: Date today
						surface: plot surface.
					plot addEvent: application ].
			plot save ]
]

{ #category : #loading }
FOMVoyageExampleLoader >> loadFarms [
	User selectAll
		do: [ :each | 
			| farm |
			farm := Farm name: 'Granja de ' , each firstName.
			farm save.
			each addFarm: farm.
			each save ]
]

{ #category : #loading }
FOMVoyageExampleLoader >> loadPlots [
	Farm selectAll
		do: [ :each | 
			each
				addPlot:
					((Plot id: 1 surface: 10)
						save;
						yourself);
				addPlot:
					((Plot id: 2 surface: 10)
						save;
						yourself).
			each save ]
]

{ #category : #loading }
FOMVoyageExampleLoader >> loadSubstances [
	| glifosato sulfato |
	glifosato := Substance
		comercialName: 'Glifosato'
		brand: 'Monsanto'
		activeIngredients: 'Glifosato de marportombolo'
		waitingPeriodAfterApplication: 45.
	glifosato save.
	sulfato := Substance
		comercialName: 'Sulfato de cobre'
		brand: 'genérico'
		activeIngredients: 'Sulfato de cobre'
		waitingPeriodAfterApplication: 0.
	sulfato save.
	Farm selectAll
		do: [ :each | 
			each
				updateStockOf: glifosato with: 10 expiringOn: Date today;
				updateStockOf: sulfato with: 5 expiringOn: Date today.
			each save ]
]

{ #category : #loading }
FOMVoyageExampleLoader >> loadUsers [
	jgomez := User
		username: 'jgomez'
		firstName: 'Juan'
		lastName: 'Gomez'
		password: 'jgtr765'.
	jgomez save.
	mlopez := User
		username: 'mlopez'
		firstName: 'María'
		lastName: 'Lopez'
		password: 'lkjdsf75'.
	mlopez save
]

{ #category : #loading }
FOMVoyageExampleLoader >> loadVarieties [
	(Variety
		vulgarName: 'Tomate perita'
		taxonomicName: 'Tomateous periteus') save.
	(Variety
		vulgarName: 'Tomate cherry'
		taxonomicName: 'Tomateous cherrisius') save
]
