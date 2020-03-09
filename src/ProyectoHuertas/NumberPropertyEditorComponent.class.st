Class {
	#name : #NumberPropertyEditorComponent,
	#superclass : #PropertyEditorComponent,
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #hooks }
NumberPropertyEditorComponent >> obtainValueFromString: aString [
	| newNumber |
	(aString includes: $,)
		ifTrue: [ problems
				add:
					'No utilice '','' para indicar los decimales en ' , label
						, '. Utilice ''.'''.
			^ bufferedValue ].
	aString isEmpty
		ifTrue: [ ^ bufferedValue ].
	[ newNumber := aString asNumber ]
		on: Error
		do: [ problems add: label , ' debe ser un numero valido.'.
			^ bufferedValue ].
	^ newNumber
]

{ #category : #hooks }
NumberPropertyEditorComponent >> renderInputOn: html [
	html textInput
		formControl;
		attributeAt: 'autocomplete' put: 'off';
		callback: [ :value | self handleCallbackWith: value ];
		with: (bufferedValue ifNil: [ '' ] ifNotNil: [ :it | it printString ]);
		id: selector
]
