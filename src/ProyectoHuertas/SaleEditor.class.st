Class {
	#name : #SaleEditor,
	#superclass : #FOMEditor,
	#instVars : [
		'dateEditorComponent',
		'clientEditorComponent',
		'listComponent'
	],
	#category : #'ProyectoHuertas-ui-editors'
}

{ #category : #'subclass-responsibility' }
SaleEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ {dateEditorComponent.
	clientEditorComponent } , super children
]

{ #category : #'subclass-responsibility' }
SaleEditor >> initializeComponents [
	"Initialize all property components"
	
	super initializeComponents.
	dateEditorComponent := DatePropertyEditorComponent
		subject: subject
		selector: #date
		label: 'Fecha'
		required: true.
	clientEditorComponent := TextLinePropertyEditorComponent
		subject: subject
		selector: #client
		label: 'Cliente'
		required: true.
]

{ #category : #rendering }
SaleEditor >> renderButtonsOn: html [
	html
		paragraph: [ html formButton
				bePrimary;
				callback: [ self accept ];
				with: 'Cargar Productos'.
			html space.
			html formButton
				beSecondary;
				callback: [ self cancel ];
				with: 'Cancel' ]
]

{ #category : #rendering }
SaleEditor >> renderContentOn: html [
	html
		form: [ self renderChildrenOn: html.
			self renderProblemsOn: html. 
			self renderButtonsOn: html].
]
