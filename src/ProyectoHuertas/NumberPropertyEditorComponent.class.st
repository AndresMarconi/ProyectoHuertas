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
	| input |
	input := html textInput.
	input
		formControl;
		noAutocomplete;
		callback: [ :value | self handleCallbackWith: value ];
		value: (bufferedValue ifNil: [ '' ] ifNotNil: [ :it | it printString ]);
		id: selector.
	required
		ifTrue: [ input attributeAt: 'required' put: 'on' ]
]
