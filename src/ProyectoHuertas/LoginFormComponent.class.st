"
WAAdmin register: LoginFormComponent asApplicationAt: 'test'
"
Class {
	#name : #LoginFormComponent,
	#superclass : #WAPluggableEditor,
	#instVars : [
		'email',
		'hashedPassword',
		'emailComponent',
		'passwordComponent',
		'problem'
	],
	#category : #'ProyectoHuertas-ui-login'
}

{ #category : #callbacks }
LoginFormComponent >> accept [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	self children do: #accept.
	self parent
		login: email greaseString trimBoth
		withHashedPassword: hashedPassword
]

{ #category : #'subclass-responsibility' }
LoginFormComponent >> children [
	^ {emailComponent.
	passwordComponent}
]

{ #category : #accessing }
LoginFormComponent >> email [
	^ email
]

{ #category : #accessing }
LoginFormComponent >> email: anObject [
	email := anObject
]

{ #category : #initilization }
LoginFormComponent >> initialize [
	emailComponent := EmailPropertyEditorComponent
		subject: self
		selector: #email
		label: 'Correo electrónico (e-mail)'
		required: true.
	passwordComponent := PasswordPropertyEditorComponent
		subject: self
		selector: #password
		label: 'Contraseña'
		required: true
]

{ #category : #initilization }
LoginFormComponent >> initializeComponents [
	^ self
]

{ #category : #accessing }
LoginFormComponent >> password [
	^ ''
]

{ #category : #accessing }
LoginFormComponent >> password: aString [
	hashedPassword := (SHA256 new hashMessage: aString asByteArray)
		asString
]

{ #category : #accessing }
LoginFormComponent >> problem [
	^ problem
]

{ #category : #accessing }
LoginFormComponent >> problem: anObject [
	problem := anObject
]

{ #category : #rendering }
LoginFormComponent >> renderButtonsOn: html [
	html
		paragraph: [ html formButton
			   id: 'login';
				bePrimary;
				callback: [ self accept ];
				with: 'Ingresar' ]
]

{ #category : #rendering }
LoginFormComponent >> renderContentOn: html [
	self renderProblemOn: html.
	super renderContentOn: html
]

{ #category : #rendering }
LoginFormComponent >> renderProblemOn: html [
	problem
		ifNotNil: [ html paragraph
				style: 'color: red;';
				with: problem ]
]
