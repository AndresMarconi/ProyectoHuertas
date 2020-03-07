Class {
	#name : #TimeStringPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #hooks }
TimeStringPropertyEditorComponent >> obtainValueFromString: aString [

	(aString matchesRegex: '^([1-9]|[0-1][0-9]|[2][0-3])\:([0-5][0-9])$')
		ifFalse: [ problems add: 'La hora debe debe ingresarse en formato HH:MM de 24 hrs'.
			^ bufferedValue ].
	aString isEmpty
		ifTrue: [ ^ bufferedValue ].
	^ aString
]

{ #category : #hooks }
TimeStringPropertyEditorComponent >> renderInputOn: html [
	html textInput
		attributeAt: 'autocomplete' put: 'off';
		formControl;
		placeholder: 'hh:mm';
		value:
			(bufferedValue
				ifNil: [ Time now print24 copyFrom: 1 to: 5 ]
				ifNotNil: [ :it | it ]);
		callback: [ :value | self handleCallbackWith: value ];
		id: selector
]
