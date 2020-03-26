Class {
	#name : #ExpertDashboardCardComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-expert-dashboard'
}

{ #category : #rendering }
ExpertDashboardCardComponent >> renderCardContentOn: html [
	self subclassResponsibility
]

{ #category : #rendering }
ExpertDashboardCardComponent >> renderContentOn: html [
	html card
		with: [ html
				cardBody: [ html cardTitle level5 with: self title.
					html cardText: [ self renderCardContentOn: html ] ] ]
]

{ #category : #rendering }
ExpertDashboardCardComponent >> title [
	self subclassResponsibility 
]
