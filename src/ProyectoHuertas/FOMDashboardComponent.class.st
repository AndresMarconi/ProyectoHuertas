Class {
	#name : #FOMDashboardComponent,
	#superclass : #FOMAbstractComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #printing }
FOMDashboardComponent >> printOn: aStream [
	aStream nextPutAll: 'Panel de Control'
]

{ #category : #rendering }
FOMDashboardComponent >> renderContentOn: html [
	html text: 'aqui va el panel de control'
]
