Class {
	#name : #NextToHarvestComponent,
	#superclass : #GAFAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
NextToHarvestComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Fecha de inicio'. 'Duracion(dias)'}
]

{ #category : #rendering }
NextToHarvestComponent >> columnValuesFor: element [

	^ {element plot id.
		element crop vulgarName.
		element harvestDate yyyymmdd.
		element harvestDuration}
]

{ #category : #accessing }
NextToHarvestComponent >> elements [
	^ ((self session farm sowings) select: [ :each | (each harvestDate) isAfter: (Date today) ])
		asSortedCollection: [ :a :b | a date < b date ].
]

{ #category : #accessing }
NextToHarvestComponent >> parent [
	^ parent
]

{ #category : #rendering }
NextToHarvestComponent >> renderContentOn: html [
	html heading level3; with: 'Proximas Cosechas'.
	html paragraph: 'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.'.
	paginator elementsPerPage: 5.
	super renderContentOn: html.
]
