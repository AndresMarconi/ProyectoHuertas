Class {
	#name : #MultipleSelectPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#instVars : [
		'possibleValuesBlock',
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
	possibleValuesBlock := [ OrderedCollection new ].
	rows := 5
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> possibleValuesBlock [
	^ possibleValuesBlock
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> possibleValuesBlock: anObject [
	possibleValuesBlock := anObject
]

{ #category : #hooks }
MultipleSelectPropertyEditorComponent >> renderInputOn: html [
	html multiSelect
		formControl;
		size: rows;
		list: possibleValuesBlock value;
		callback: [ :value | self handleCallbackWith: value ];
		selected: bufferedValue;
		id: self id
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> rows [
	^ rows
]

{ #category : #accessing }
MultipleSelectPropertyEditorComponent >> rows: anObject [
	rows := anObject
]
