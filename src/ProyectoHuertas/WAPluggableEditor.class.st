Class {
	#name : #WAPluggableEditor,
	#superclass : #WAComponent,
	#instVars : [
		'subject',
		'parent'
	],
	#category : #'ProyectoHuertas-widgets'
}

{ #category : #callbacks }
WAPluggableEditor >> accept [
	(self children anySatisfy: [ :each | each hasProblems ])
		ifTrue: [ ^ self ].
	self children do: #accept.
	parent
		ifNil: [ self answer: subject ]
		ifNotNil: [ :it | it answer: subject ]
]

{ #category : #callbacks }
WAPluggableEditor >> cancel [
	self children do: #cancel.
	parent ifNil: [ self answer: nil ] ifNotNil: [ :it | it answer: nil ]
]

{ #category : #'subclass-responsibility' }
WAPluggableEditor >> children [
	"Return all property editors in this editor, in the order you want them to be rendered"

	^ self subclassResponsibility
]

{ #category : #initialization }
WAPluggableEditor >> initialize [
	super initialize.
	self intializeComponents
]

{ #category : #'subclass-responsibility' }
WAPluggableEditor >> intializeComponents [
	"Initialize all property components"

	^ self subclassResponsibility
]

{ #category : #accessing }
WAPluggableEditor >> parent [
	^ parent
]

{ #category : #accessing }
WAPluggableEditor >> parent: anObject [
	parent := anObject
]

{ #category : #rendering }
WAPluggableEditor >> renderButtonsOn: html [
	html
		paragraph: [ html formButton
				beSecondary;
				callback: [ self cancel ];
				with: 'Cancel'.
			html space.
			html formButton
				bePrimary;
				callback: [ self accept ];
				with: 'Accept' ]
]

{ #category : #rendering }
WAPluggableEditor >> renderChildrenOn: html [
	self children do: [ :each | html render: each ]
]

{ #category : #rendering }
WAPluggableEditor >> renderContentOn: html [
	html
		form: [ self renderChildrenOn: html.
			self renderProblemsOn: html.
			self renderButtonsOn: html ]
]

{ #category : #rendering }
WAPluggableEditor >> renderProblemsOn: html [
	(self children flatCollect: #problems)
		do: [ :each | 
			html alert
				beDanger;
				with: each ]
]

{ #category : #rendering }
WAPluggableEditor >> rendererClass [
	^ SBSHtmlCanvas
]

{ #category : #accessing }
WAPluggableEditor >> subject [
	^ subject
]

{ #category : #accessing }
WAPluggableEditor >> subject: anObject [
	subject := anObject
]
