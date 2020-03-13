Class {
	#name : #MultipleSelectPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#instVars : [
		'possibleValues',
		'rows'
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
	possibleValues := OrderedCollection new.
	rows := 5
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
		size: rows;
		list: possibleValues;
		callback: [ :value | self handleCallbackWith: value ];
		selected: bufferedValue;
		id: selector
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> rows [
	^ rows
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> rows: anObject [
	rows := anObject
]
