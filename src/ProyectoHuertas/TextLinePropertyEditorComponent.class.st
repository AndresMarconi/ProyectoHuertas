Class {
	#name : #TextLinePropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #'subclass-responsibility' }
TextLinePropertyEditorComponent >> renderInputOn: html [
	^ html textInput
		attributeAt: 'autocomplete' put: 'off';
		readonly: readOnly;
		formControl;
		callback: [ :value | self handleCallbackWith: value ];
		with: bufferedValue;
		id: selector
]
