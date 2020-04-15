Class {
	#name : #TestGAFSessionForSampleUser,
	#superclass : #GAFSession,
	#category : #'ParasolHuertas-helpers'
}

{ #category : #initialization }
TestGAFSessionForSampleUser >> initialize [
	super initialize.
	user := GAFUser
		selectOne:
			[ :each | each email = ParasolHelperForDataPreparation new sampleEmail ]
]
