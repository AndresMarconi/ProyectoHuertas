Class {
	#name : #FOMBachAddActiveIngredientsComponent,
	#superclass : #FOMAbstractComponent,
	#instVars : [
		'crop',
		'selectedIngredients',
		'selectedIngredientsComponent'
	],
	#category : #'ProyectoHuertas-ui-expert'
}

{ #category : #'instance creation' }
FOMBachAddActiveIngredientsComponent class >> crop: aCrop [
	^ self new
		crop: aCrop;
		yourself
]

{ #category : #callbacks }
FOMBachAddActiveIngredientsComponent >> accept [
	selectedIngredientsComponent accept.
	selectedIngredientsComponent hasProblems
		ifTrue: [ ^ self ].
	selectedIngredients
		do: [ :each | 
			ActiveIngredient new
				tradeName: each;
				save ].
	self answer
]

{ #category : #private }
FOMBachAddActiveIngredientsComponent >> activeIngredients [
	| registered existing |
	registered := SenasaCatalogue singleton
		registeredIngredientsForCropNamed: crop vulgarName.
	existing := self session activeIngredients collect: #tradeName.
	^ registered copyWithoutAll: existing
]

{ #category : #callbacks }
FOMBachAddActiveIngredientsComponent >> cancel [
	^ self answer
]

{ #category : #accessing }
FOMBachAddActiveIngredientsComponent >> crop [
	^ crop
]

{ #category : #accessing }
FOMBachAddActiveIngredientsComponent >> crop: anObject [
	crop := anObject.
	selectedIngredientsComponent possibleValues: self activeIngredients
]

{ #category : #initialization }
FOMBachAddActiveIngredientsComponent >> initialize [
	super initialize.
	selectedIngredients := OrderedCollection new.
	selectedIngredientsComponent := MultipleSelectPropertyEditorComponent
		subject: self
		selector: #selectedIngredients
		label: 'Ingredientes a agregar'
		required: true.
	selectedIngredientsComponent
		instructions: 'Mantenga oprimido el botón Ctrl para seleccionar más de uno';
		rows: 20
]

{ #category : #rendering }
FOMBachAddActiveIngredientsComponent >> renderButtonsOn: html [
	html
		paragraph: [ html formButton
				bePrimary;
				callback: [ self accept ];
				with: 'Aceptar'.
			html space.
			html formButton
				beSecondary;
				callback: [ self cancel ];
				with: 'Cancelar' ]
]

{ #category : #rendering }
FOMBachAddActiveIngredientsComponent >> renderContentOn: html [
	html
		form: [ html render: selectedIngredientsComponent.
			self renderProblemsOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
FOMBachAddActiveIngredientsComponent >> renderProblemsOn: html [
	selectedIngredientsComponent problems
		do: [ :each | 
			html alert
				beDanger;
				with: each ]
]

{ #category : #accessing }
FOMBachAddActiveIngredientsComponent >> selectedIngredients [
	^ selectedIngredients
]

{ #category : #accessing }
FOMBachAddActiveIngredientsComponent >> selectedIngredients: anObject [
	selectedIngredients := anObject
]
