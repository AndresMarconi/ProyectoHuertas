Class {
	#name : #FOMNextToHarvestComponent,
	#superclass : #FOMAbstractTableComponent,
	#category : #'ProyectoHuertas-ui-farmer'
}

{ #category : #rendering }
FOMNextToHarvestComponent >> columnHeadings [
	^  {'Lote'. 'Cultivo' . 'Fecha de inicio'. 'Duracion(dias)'}
]

{ #category : #rendering }
FOMNextToHarvestComponent >> columnValuesFor: element [

	^ {element plot id.
		element crop vulgarName.
		element harvestDate yyyymmdd.
		element harvestDuration}
]

{ #category : #accessing }
FOMNextToHarvestComponent >> elements [
	^ ((self session sowings) select: [ :each | (each harvestDate) isAfter: (Date today) ])
		asSortedCollection: [ :a :b | a date < b date ].
]

{ #category : #accessing }
FOMNextToHarvestComponent >> parent [
	^ parent
]

{ #category : #rendering }
FOMNextToHarvestComponent >> renderContentOn: html [
	html heading level3; with: 'Proximas Cosechas'.
	html paragraph: 'Los siguientes fechas de cosecha de acercan - evite aplicar fitosanitarios.'.
	super renderContentOn: html.
]
