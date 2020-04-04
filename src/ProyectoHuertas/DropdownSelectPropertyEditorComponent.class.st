Class {
	#name : #DropdownSelectPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#instVars : [
		'possibleValues',
		'labelsBlock'
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
DropdownSelectPropertyEditorComponent >> labelsBlock [
	^ labelsBlock
]

{ #category : #accessing }
DropdownSelectPropertyEditorComponent >> labelsBlock: anObject [
	labelsBlock := anObject
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
	| select |
	readOnly
		ifFalse: [ select := html select.
			select
				formControl;
				list: possibleValues;
				callback: [ :value | self handleCallbackWith: value ];
				selected: bufferedValue;
				id: selector.
			labelsBlock ifNotNil: [ select labels: labelsBlock ] ]
		ifTrue: [ html textInput
				formControl;
				readonly: true;
				with: bufferedValue ]
]
