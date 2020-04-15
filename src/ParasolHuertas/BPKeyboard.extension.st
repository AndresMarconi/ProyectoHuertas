Extension { #name : #BPKeyboard }

{ #category : #'*ParasolHuertas' }
BPKeyboard >> sendKeys: aString modifiedBy: aControlCharacter [
	self sendKeys: {aControlCharacter} , aString , {BPKeys null}
]
