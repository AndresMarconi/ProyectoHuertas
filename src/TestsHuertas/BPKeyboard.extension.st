Extension { #name : #BPKeyboard }

{ #category : #'*TestsHuertas' }
BPKeyboard >> sendKeys: aString modifiedBy: aControlCharacter [
	self sendKeys: {aControlCharacter} , aString , {BPKeys null}
]
