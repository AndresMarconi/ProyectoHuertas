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
	html inputGroup
		with: [ html
				inputGroupPrepend: [ html select
						formControl;
						callback: [ :value | bufferedValue unit: value ];
						list: allowedUnits;
						selected: bufferedValue unit;
						id: selector , '-magnitude' ].
			html textInput
				formControl;
				callback: [ :value | self handleCallbackWith: value ];
				with: bufferedValue magnitude printString;
				id: selector , '-magnitude' ]
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