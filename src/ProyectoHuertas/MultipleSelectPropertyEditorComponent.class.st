Class {
	#name : #MultipleSelectPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#instVars : [
		'possibleValues'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #rendering }
MultipleSelectPropertyEditorComponent >> handleCallbackWith: anObject [
	problems := OrderedCollection new.
	anObject isEmpty & required
		ifTrue: [ problems add: label , ' es un dato obligatorio - debe seleccionarl al menos un elemento.'.
			^ self ].
	bufferedValue := anObject
]

{ #category : #initialization }
MultipleSelectPropertyEditorComponent >> initialize [
	possibleValues := OrderedCollection new
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> possibleValues [
	^ possibleValues
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> possibleValues: anObject [
	possibleValues := anObject
]

{ #category : #hooks }
MultipleSelectPropertyEditorComponent >> renderInputOn: html [
	html multiSelect
		formControl;
		list: possibleValues;
		callback: [ :value | self handleCallbackWith: value ];
		selected: bufferedValue;
		id: selector
]
