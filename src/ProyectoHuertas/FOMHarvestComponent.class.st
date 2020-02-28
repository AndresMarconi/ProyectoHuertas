Class {
	#name : #FOMHarvestComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMHarvestComponent >> addEvent [
	| editedEvent |
	editedEvent := self call: (HarvestingEditor subject: Harvesting new).
	editedEvent
		ifNotNil: [ :it | 
			it save.
			it plot addEvent: it.
			it plot save ]
]

{ #category : #rendering }
FOMHarvestComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }
]

{ #category : #rendering }
FOMHarvestComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Variedad' . 'Cantidad'. 'Superficie (m2)'. }}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element variety vulgarName.
	element surface.
	element quantity}
]

{ #category : #callbacks }
FOMHarvestComponent >> editElement: element [
	(self call: (HarvestingEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMHarvestComponent >> elements [
	^ (self session harvestings) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMHarvestComponent >> printOn: aStream [
	aStream nextPutAll: 'Cosecha'
]

{ #category : #rendering }
FOMHarvestComponent >> renderContentOn: html [
	super renderContentOn: html.
	html break.
	html anchor
		callback: [ self addEvent ];
		with: [ html formButton
				bePrimary;
				with: 'Registrar cosecha' ]
]
