Class {
	#name : #TextAreaPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #rendering }
TextAreaPropertyEditorComponent >> renderInputOn: html [
	^ html textArea
		rows: 3;
		formControl;
		callback: [ :value | self handleCallbackWith: value ];
		with: bufferedValue;
		id: selector
]
