Class {
	#name : #PasswordPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #hooks }
PasswordPropertyEditorComponent >> renderInputOn: html [
	| input |
	input := html passwordInput.
	input
		noAutocomplete;
		formControl;
		callback: [ :value | self handleCallbackWith: value ];
		value: bufferedValue;
		id: selector.
	required
		ifTrue: [ input attributeAt: 'required' put: 'on' ]
]
