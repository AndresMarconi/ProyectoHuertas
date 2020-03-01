Class {
	#name : #FOMApplicationsComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #adding }
FOMApplicationsComponent >> addEvent [
	| editedEvent |
	editedEvent := self call: (AplicationEditor subject: Application new).
	editedEvent
		ifNotNil: [ :it | 
			it save.
			it plot addEvent: it.
			it plot save ]
]

{ #category : #rendering }
FOMApplicationsComponent >> columnHeadings [
	^ {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}
]

{ #category : #rendering }
FOMApplicationsComponent >> columnValuesFor: element [
	" {'Fecha' . 'Lote' . 'Producto' . 'Dosis'}"

	^ {element date asDate ddmmyyyy.
	element plot id.
	element substance comercialName.
	element dose}
]

{ #category : #callbacks }
FOMApplicationsComponent >> editElement: element [
	(self call: (AplicationEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #callbacks }
FOMApplicationsComponent >> elements [
	^ (self session aplications) asSortedCollection: [ :a :b | a date > b date ]
]

{ #category : #printing }
FOMApplicationsComponent >> printOn: aStream [
	aStream nextPutAll: 'Aplicaciones'
]

{ #category : #rendering }
FOMApplicationsComponent >> renderContentOn: html [
	super renderContentOn: html.
	html break.
	html anchor
		callback: [ self addEvent ];
		with: [ html formButton
				bePrimary;
				with: 'Registrar aplicacion' ]
]
