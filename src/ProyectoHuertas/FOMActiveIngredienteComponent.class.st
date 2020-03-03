Class {
	#name : #FOMActiveIngredienteComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMActiveIngredienteComponent >> columnHeadings [
	^ {'Nombre' . 'URL de referencia'}
]

{ #category : #rendering }
FOMActiveIngredienteComponent >> columnValuesFor: element [
	^ {element tradeName.
	element referenceUrl}
]

{ #category : #hooks }
FOMActiveIngredienteComponent >> elementClass [
	^ ActiveIngredient
]

{ #category : #hooks }
FOMActiveIngredienteComponent >> elementEditorClass [
	^ ActiveIngredientEditor
]

{ #category : #accessing }
FOMActiveIngredienteComponent >> elements [
	^ self session activeIngredients
]

{ #category : #accessing }
FOMActiveIngredienteComponent >> renderContentOn: html [
	super renderContentOn: html.
	html
		paragraph: [ html anchor
				callback: [ self addEvent ];
				with: [ html formButton
						bePrimary;
						with: 'Agregar' ] ]
]
