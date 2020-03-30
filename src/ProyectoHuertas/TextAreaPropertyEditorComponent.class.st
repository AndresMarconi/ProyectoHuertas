Class {
	#name : #TextAreaPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #rendering }
TextAreaPropertyEditorComponent >> renderInputOn: html [
	^ html textArea
		rows: 3;
		readonly: readOnly;
		formControl;
		noAutocomplete;
		callback: [ :value | self handleCallbackWith: value ];
		value: bufferedValue;
		id: selector
]
