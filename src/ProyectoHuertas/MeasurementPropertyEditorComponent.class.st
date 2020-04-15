Class {
	#name : #MeasurementPropertyEditorComponent,
	#superclass : #NumberPropertyEditorComponent,
	#instVars : [
		'allowedUnits'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #'instance creation' }
MeasurementPropertyEditorComponent class >> subject: anObject selector: aMessageSelector label: aLabel required: aBoolean units: aCollectionOfStrings [
	^ self new
		subject: anObject
			selector: aMessageSelector
			label: aLabel
			required: aBoolean
			units: aCollectionOfStrings;
		yourself
]

{ #category : #accessing }
MeasurementPropertyEditorComponent >> allowedUnits [
	^ allowedUnits
]

{ #category : #accessing }
MeasurementPropertyEditorComponent >> allowedUnits: anObject [
	allowedUnits := anObject
]

{ #category : #callbacks }
MeasurementPropertyEditorComponent >> handleCallbackWith: aString [
	problems := OrderedCollection new.
	aString isEmpty & required
		ifTrue: [ problems add: label , ' es un dato obligatorio.'.
			^ self ].
	bufferedValue magnitude: (self obtainValueFromString: aString)
]

{ #category : #initialization }
MeasurementPropertyEditorComponent >> initialize [
	super initialize.
	allowedUnits := OrderedCollection with: nil
]

{ #category : #hooks }
MeasurementPropertyEditorComponent >> renderInputOn: html [
	| input |
	html inputGroup
		with: [ html
				inputGroupPrepend: [ html select
						formControl;
						callback: [ :value | bufferedValue unit: value ];
						list: allowedUnits;
						selected: bufferedValue unit;
						id: self id , '-unit' ].
			input := html textInput.
			input
				formControl;
				noAutocomplete;
				callback: [ :value | self handleCallbackWith: value ];
				value: bufferedValue magnitude printString;
				id: self id , '-magnitude'.
			required
				ifTrue: [ input attributeAt: 'required' put: 'on' ] ]
]

{ #category : #initialization }
MeasurementPropertyEditorComponent >> subject: anObject selector: aMessageSelector label: aLabel required: aBoolean [
	super
		subject: anObject
		selector: aMessageSelector
		label: aLabel
		required: aBoolean.
	bufferedValue
		ifNil:
			[ bufferedValue := Measurement magnitude: 0 unit: allowedUnits first ]
]

{ #category : #initialization }
MeasurementPropertyEditorComponent >> subject: anObject selector: aMessageSelector label: aLabel required: aBoolean units: aCollectionOfStrings [
	allowedUnits := aCollectionOfStrings.
	super
		subject: anObject
		selector: aMessageSelector
		label: aLabel
		required: aBoolean.
	bufferedValue
		ifNil: [ bufferedValue := Measurement magnitude: 0 unit: allowedUnits first ]
]
