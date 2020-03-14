Class {
	#name : #ActiveIngredientEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'tradeNameEditorComponent',
		'referenceUrlEditorComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
ActiveIngredientEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {tradeNameEditorComponent.
	referenceUrlEditorComponent} , super children
]

{ #category : #'subclass-responsibility' }
ActiveIngredientEditor >> initializeComponents [
	"Initialize all property components"

	tradeNameEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #tradeName
		label: 'Nombre'
		required: true.
	referenceUrlEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #referenceUrl
		label: 'URL de referencia'
		required: false.
	super initializeComponents
]

{ #category : #rendering }
ActiveIngredientEditor >> renderChildrenOn: html [
	super renderChildrenOn: html.
	html label: 'Registro SENASA'.
	html
		paragraph:
			(self
				asCommaSeparatedList:
					((subject senasaApplicabilityRecords
						asSortedCollection: [ :a :b | a crop vulgarName < b crop vulgarName ])
						collect:
							[ :record | record crop vulgarName , ' (' , record residue printString , ' mg/Kg)' ]))
]
