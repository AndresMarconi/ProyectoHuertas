Extension { #name : #Time }

{ #category : #'*ProyectoHuertas' }
Time >> print24WithoutSeconds [
 	"Return as 8-digit string 'hh:mm:ss', with leading zeros if needed"
 
 	^ String new: 5 streamContents: [ :aStream | 
		self print24: true showSeconds: false on: aStream ]
 
 
]
