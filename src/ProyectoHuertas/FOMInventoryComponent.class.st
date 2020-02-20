Class {
	#name : #FOMInventoryComponent,
	#superclass : #FOMAbstractListComponent,
	#category : #'ProyectoHuertas-ui-core'
}

{ #category : #rendering }
FOMInventoryComponent >> columnHeadings [
	^ {'Nombre comercial' . 'Marca' . 'Cantidad disponible'.
	'Fecha de expiración'}
]

{ #category : #rendering }
FOMInventoryComponent >> columnValuesFor: element [
	^ {element substance comercialName.
	element substance brand.
	element quantity.
	element expirationDate ddmmyyyy}
]

{ #category : #callbacks }
FOMInventoryComponent >> editElement: element [
	(self call: (PurchaseEditor subject: element))
		ifNotNil: [ :it | it save ]
]

{ #category : #accessing }
FOMInventoryComponent >> elements [
	^ (self session user) inventory
]

{ #category : #printing }
FOMInventoryComponent >> printOn: aStream [
	aStream nextPutAll: 'Inventario'
]

{ #category : #rendering }
FOMInventoryComponent >> renderContentOn: html [
	html text: 'inventario'
]
