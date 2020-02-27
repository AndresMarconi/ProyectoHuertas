Class {
	#name : #FOMSowingComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #callbacks }
FOMSowingComponent >> addEvent [
	| editedEvent |
	editedEvent := self call: (SowingEditor subject: Sowing new).
	editedEvent
		ifNotNil: [ :it | 
			it save.
			it plot addEvent: it.
			it plot save ]
]

{ #category : #rendering }
FOMSowingComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Cultivo' . 'Cantidad'}
]

{ #category : #rendering }
FOMSowingComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. . }}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element variety vulgarName.
	element quantity}
]

{ #category : #callbacks }
FOMSowingComponent >> editElement: element [
	(self call: (SowingEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMSowingComponent >> elements [
	^ (self session sowings) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMSowingComponent >> printOn: aStream [
	aStream nextPutAll: 'Plantación y siembra'
]

{ #category : #printing }
FOMSowingComponent >> renderContentOn: html [
	super renderContentOn: html.
	html break.
	html anchor
		callback: [ self addEvent ];
		with: [ html formButton
				bePrimary;
				with: 'Registrar siembra' ]
]
