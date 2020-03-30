Class {
	#name : #GAFAdminComponent,
	#superclass : #GAFAbstractComponent,
	#category : #'ProyectoHuertas-ui-common'
}

{ #category : #rendering }
GAFAdminComponent >> renderContentOn: html [
	html heading: 'Panel de administración'.
	html
		unorderedList: [ self session gapAFarm users
				do: [ :each | 
					html
						listItem: [ html text: each email.
							html space.
							self renderToggleExpertFor: each on: html.
							html space.
							self renderToggleAdminFor: each on: html ] ] ].
	html anchor
		callback: [ self answer ];
		with: [ html button with: 'Volver' ]
]

{ #category : #rendering }
GAFAdminComponent >> renderToggleAdminFor: each on: html [
	^ each isAdmin
		ifTrue: [ html anchor
				callback: [ each
						isAdmin: false;
						save ];
				with: 'Quitar admin' ]
		ifFalse: [ html anchor
				callback: [ each
						isAdmin: true;
						save ];
				with: 'Otorgar admin' ]
]

{ #category : #rendering }
GAFAdminComponent >> renderToggleExpertFor: each on: html [
	^ each isExpert
		ifTrue: [ html anchor
				callback: [ each
						isExpert: false;
						save ];
				with: 'Quitar experto' ]
		ifFalse: [ html anchor
				callback: [ each
						isExpert: true;
						save ];
				with: 'Otorgar experto' ]
]
