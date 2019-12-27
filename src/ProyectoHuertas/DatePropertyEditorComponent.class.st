Class {
	#name : #DatePropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #hooks }
DatePropertyEditorComponent >> obtainValueFromString: aString [
	| newDate |
	[ newDate := (DateParser
		readingFrom: aString readStream
		pattern: 'd/m/y') parse ]
		on: Error
		do: [ problems
				add: label , ' debe ser una fecha valida en formato dd/mm/aaaa.'.
			^ bufferedValue ].
	^ newDate
]

{ #category : #hooks }
DatePropertyEditorComponent >> renderInputOn: html [
	html textInput
	   attributeAt: 'autocomplete' put: 'off'; 
		formControl;
		placeholder: 'dd/mm/aaaa';
		value: (bufferedValue ifNil: [ '' ] ifNotNil: [ :it | it ddmmyyyy ]);
		callback: [ :value | self handleCallbackWith: value ];
		id: selector;
		script:
			(html jQuery new datepicker
				dateFormat: 'dd/mm/yy';
				onSelect: html jQuery ajax serializeThis)
]
