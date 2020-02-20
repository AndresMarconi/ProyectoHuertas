Class {
	#name : #FOMPlotsManagementComponent,
	#superclass : #FOMAbstractListComponent,
	#instVars : [
		'plot'
	],
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMPlotsManagementComponent >> columnHeadings [
	^ {'Fecha' . 'Tipo de evento' . 'Resumen'}
]

{ #category : #rendering }
FOMPlotsManagementComponent >> columnValuesFor: element [
	^ {element date asDate ddmmyyyy.
	(self typeDescriptorFor: element).
	(element summaryFor: self)}
]

{ #category : #callbacks }
FOMPlotsManagementComponent >> editElement: element [
	(self call: element editor)
		ifNotNil: [ :it | 
			it save.
			self plot save ]
]

{ #category : #accessing }
FOMPlotsManagementComponent >> elements [
	^ plot ifNil: [ Array new ] ifNotNil: [ plot events ]
]

{ #category : #printing }
FOMPlotsManagementComponent >> printOn: aStream [
	aStream nextPutAll: 'Lotes'
]

{ #category : #rendering }
FOMPlotsManagementComponent >> renderContentOn: html [
	html text: 'informacion de lotes / opciones'
]
