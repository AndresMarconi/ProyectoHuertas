Class {
	#name : #DropdownSelectPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#instVars : [
		'possibleValues'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #hooks }
DropdownSelectPropertyEditorComponent >> handleCallbackWith: anObject [
	problems := OrderedCollection new.
	anObject isNil & required
		ifTrue: [ problems add: label , ' es un dato obligatorio.'.
			^ self ].
	bufferedValue := anObject
]

{ #category : #hooks }
DropdownSelectPropertyEditorComponent >> initialize [
	possibleValues := OrderedCollection new
]

{ #category : #accessing }
DropdownSelectPropertyEditorComponent >> possibleValues [
	^ possibleValues
]

{ #category : #accessing }
DropdownSelectPropertyEditorComponent >> possibleValues: anObject [
	possibleValues := anObject
]

{ #category : #hooks }
DropdownSelectPropertyEditorComponent >> renderInputOn: html [
	readOnly
		ifFalse: [ html select
				formControl;
				list: possibleValues;
				callback: [ :value | self handleCallbackWith: value ];
				selected: bufferedValue;
				id: selector ]
		ifTrue: [ html textInput
				formControl;
				readonly: true;
				with: bufferedValue ]
]
