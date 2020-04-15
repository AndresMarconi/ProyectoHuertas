Class {
	#name : #PropertyEditorComponent,
	#superclass : #WAComponent,
	#instVars : [
		'id',
		'label',
		'readOnly',
		'required',
		'problems',
		'bufferedValue',
		'instructions',
		'setBlock',
		'getBlock',
		'subject'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #'instance creation' }
PropertyEditorComponent class >> subject: anObject getBlock: aGetBlock setBlock: aSetBlock label: aLabel required: aBoolean [
	^ self new
		subject: anObject
			getBlock: aGetBlock
			setBlock: aSetBlock
			label: aLabel
			required: aBoolean;
		yourself
]

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
	setBlock value: subject value: bufferedValue.
	problems := OrderedCollection new
]

{ #category : #accessing }
PropertyEditorComponent >> addProblem: aProblemString [
	problems add: aProblemString
]

{ #category : #accessing }
PropertyEditorComponent >> bufferedValue [
	^ bufferedValue
]

{ #category : #accessing }
PropertyEditorComponent >> bufferedValue: anObject [
	^ bufferedValue := anObject
]

{ #category : #api }
PropertyEditorComponent >> cancel [
	bufferedValue := getBlock value: subject.
	problems := OrderedCollection new
]

{ #category : #accessing }
PropertyEditorComponent >> getBlock [
	^ getBlock
]

{ #category : #accessing }
PropertyEditorComponent >> getBlock: anObject [
	getBlock := anObject
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
PropertyEditorComponent >> id [
	^ id ifNil: [ id := Time millisecondClockValue asString ]
]

{ #category : #accessing }
PropertyEditorComponent >> instructions [
	^ instructions
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

{ #category : #accessing }
PropertyEditorComponent >> problems: anObject [
	problems := anObject
]

{ #category : #accessing }
PropertyEditorComponent >> readOnly: anObject [
	readOnly := anObject
]

{ #category : #rendering }
PropertyEditorComponent >> renderContentOn: html [
	html
		formGroup: [ self renderLabelOn: html.
			self renderInputOn: html ]
]

{ #category : #hooks }
PropertyEditorComponent >> renderInputOn: html [
	^ self subclassResponsibility
]

{ #category : #rendering }
PropertyEditorComponent >> renderInstructionsOn: html [
	readOnly
		ifTrue: [ ^ self ].
	instructions
		ifNotNil: [ html
				break;
				small: instructions ]
]

{ #category : #rendering }
PropertyEditorComponent >> renderLabelOn: html [
	html label
		for: self id;
		with: [ html text: label.
			required
				ifTrue: [ html span
						style: 'color: red; ';
						with: ' *' ].
			self renderInstructionsOn: html ]
]

{ #category : #rendering }
PropertyEditorComponent >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #accessing }
PropertyEditorComponent >> required [
	^ required
]

{ #category : #accessing }
PropertyEditorComponent >> required: anObject [
	required := anObject
]

{ #category : #accessing }
PropertyEditorComponent >> setBlock [
	^ setBlock
]

{ #category : #accessing }
PropertyEditorComponent >> setBlock: anObject [
	setBlock := anObject
]

{ #category : #initialization }
PropertyEditorComponent >> setDefault: aValue [
	bufferedValue := aValue
]

{ #category : #initialization }
PropertyEditorComponent >> subject: anObject getBlock: aGetBlock setBlock: aSetBlock label: aLabel required: aBoolean [
	subject := anObject.
	getBlock := aGetBlock.
	setBlock := aSetBlock.
	label := aLabel.
	required := aBoolean.
	problems := OrderedCollection new.
	bufferedValue := getBlock value: subject.
	readOnly := false
]

{ #category : #initialization }
PropertyEditorComponent >> subject: anObject selector: aMessageSelector label: aLabel required: aBoolean [
	self
		subject: anObject
		getBlock: [ :theSubject | theSubject perform: aMessageSelector ]
		setBlock:
			[ :theSubject :value | theSubject perform: aMessageSelector asMutator with: value ]
		label: aLabel
		required: aBoolean
]

{ #category : #updating }
PropertyEditorComponent >> updateRoot: aWARoot [
	super updateRoot: aWARoot.
	JQBaseTheme default updateRoot: aWARoot
]
