Class {
	#name : #TestGAFSessionForSampleUser,
	#superclass : #GAFSession,
	#category : #'TestsHuertas-helpers'
}

{ #category : #initialization }
TestGAFSessionForSampleUser >> initialize [
	super initialize.
	user := GAFUser
		selectOne:
			[ :each | each email = ParasolHelperForDataPreparation new sampleEmail ]
]
