Class {
	#name : #PropertyEditorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'subject',
		'selector',
		'label',
		'required',
		'problems',
		'bufferedValue',
		'instructions'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #'instance creation' }
PropertyEditorComponent class >> subject: anObject selector: aMessageSelector label: aLabel required: aBoolean [
	^ self new
		subject: anObject
			selector: aMessageSelector
			label: aLabel
			required: aBoolean;
		yourself
]

{ #category : #api }
PropertyEditorComponent >> accept [
	subject perform: selector asMutator with: bufferedValue.
	problems := OrderedCollection new
]

{ #category : #api }
PropertyEditorComponent >> cancel [
	bufferedValue := subject perform: selector.
	problems := OrderedCollection new
]

{ #category : #rendering }
PropertyEditorComponent >> handleCallbackWith: aString [
	problems := OrderedCollection new.
	aString isEmpty & required
		ifTrue: [ problems add: label , ' es un dato obligatorio.'.
			^ self ].
	bufferedValue := self obtainValueFromString: aString
]

{ #category : #api }
PropertyEditorComponent >> hasProblems [
	^ problems notEmpty
]

{ #category : #accessing }
PropertyEditorComponent >> instructions: anObject [
	instructions := anObject
]

{ #category : #hooks }
PropertyEditorComponent >> obtainValueFromString: value [
	^ value
]

{ #category : #accessing }
PropertyEditorComponent >> problems [
	^ problems
]

{ #category : #rendering }
PropertyEditorComponent >> renderContentOn: html [
	html
		formGroup: [ self renderLabelOn: html.
			self renderInstructionsOn: html.
			self renderInputOn: html ]
]

{ #category : #hooks }
PropertyEditorComponent >> renderInputOn: html [
	^ self subclassResponsibility
]

{ #category : #rendering }
PropertyEditorComponent >> renderInstructionsOn: html [
	instructions
		ifNotNil: [ html
				break;
				small: instructions ]
]

{ #category : #rendering }
PropertyEditorComponent >> renderLabelOn: html [
	html label
		for: selector;
		with: [ html text: label.
			required
				ifTrue: [ html text: ' *' ] ]
]

{ #category : #rendering }
PropertyEditorComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #accessing }
PropertyEditorComponent >> required [
	^ required
]

{ #category : #initialization }
PropertyEditorComponent >> setDefault: aValue [
	bufferedValue := aValue
]

{ #category : #initialization }
PropertyEditorComponent >> subject: anObject selector: aMessageSelector label: aLabel required: aBoolean [
	subject := anObject.
	selector := aMessageSelector.
	label := aLabel.
	required := aBoolean.
	problems := OrderedCollection new.
	bufferedValue := subject perform: selector
]

{ #category : #updating }
PropertyEditorComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	JQBaseTheme default updateRoot: aWARoot
]
