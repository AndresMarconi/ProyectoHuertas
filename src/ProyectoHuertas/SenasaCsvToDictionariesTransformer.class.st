"
Produces JSON of the form: 
 
[{ ""crop"" : ""Tomate"",
   ""ingredient"" : ""clofentezine"",
   ""applicabilities"" : [""Insecticida"",""Fungicida""],
   ""residue"" : 3 }]
"
Class {
	#name : #SenasaCsvToDictionariesTransformer,
	#superclass : #Object,
	#category : #'ProyectoHuertas-senasa'
}

{ #category : #constants }
SenasaCsvToDictionariesTransformer class >> normalizedApplicabilities [
	^ {('tt' -> 'tratamiento de semillas').
	('ah' -> 'antídoto de herbicidas').
	('ba' -> 'bactericida').
	('fr' -> 'fitorreguladores').
	('he' -> 'herbicida').
	('fu' -> 'fungicida').
	('in' -> 'insecticida').
	('ac' -> 'acaricida').
	('ne' -> 'nematicida').
	('go' -> 'gorgojicida').
	('rd' -> 'rodenticida').
	('mo' -> 'molusquicida').
	('tu' -> 'tucuricida').
	('ma' -> 'matababosas y caracoles').
	('pm' -> 'preservador de madera').
	('ho' -> 'hormiguicida')} asDictionary
]

{ #category : #data }
SenasaCsvToDictionariesTransformer class >> res608year12 [
	^ self new
		fromRes608Year2012Stream: FOMLibrary new res60812anexoCsv readStream
]

{ #category : #data }
SenasaCsvToDictionariesTransformer class >> res934year10 [
	^ self new
		fromRes934Year2010Stream: FOMLibrary new res93410anexoCsv readStream
]

{ #category : #'934' }
SenasaCsvToDictionariesTransformer >> applicabilitiesFor934Value: aString [
	| applicabilitiesInString |
	applicabilitiesInString := (aString copyWithoutAll: {$( . $)})
		splitOn:
			{$-.
			Character space}.
	applicabilitiesInString := applicabilitiesInString
		collect: [ :each | 
			self
				fix934TyposIn: (self expand934AbbreviationsIn: each asLowercase trimBoth) ].
	^ applicabilitiesInString
]

{ #category : #'608' }
SenasaCsvToDictionariesTransformer >> dictionaryFrom608Year2012Row: row [
	| activePrinciples dictionaries residues |
	dictionaries := OrderedCollection new.
	activePrinciples := (row third splitOn: $+)
		collect: [ :each | each asLowercase trimBoth ].
	residues := ((row at: 10) splitOn: $+)
		collect:
			[ :each | self residueFromString: each ].
	activePrinciples
		with: residues
		do: [ :principle :residue | 
			dictionaries
				add:
					(Dictionary new
						at: 'crop' put: row first trimBoth asLowercase capitalized;
						at: 'principle' put: principle;
						at: 'applicabilities' put: #('insecticida');
						at: 'residue' put: residue;
						yourself) ].
	^ dictionaries
]

{ #category : #'934' }
SenasaCsvToDictionariesTransformer >> dictionaryFrom934Year2010Row: row [
	^ Dictionary new
		at: 'crop'
			put:
			(row third
				ifNil: [  ]
				ifNotNil: [ :it | it asLowercase trimBoth capitalized ]);
		at: 'principle'
			put: (row first ifNil: [  ] ifNotNil: [ :it | it asLowercase trimBoth ]);
		at: 'applicabilities'
			put:
			(row first
				ifNil: [ #() ]
				ifNotNil: [ :it | self applicabilitiesFor934Value: it ]);
		at: 'residue' put: (self residueFromString: row fourth);
		yourself
]

{ #category : #'934' }
SenasaCsvToDictionariesTransformer >> expand934AbbreviationsIn: aString [
	^ self class normalizedApplicabilities
		at: aString
		ifAbsent: [ aString ]
]

{ #category : #'934' }
SenasaCsvToDictionariesTransformer >> fix934TyposIn: aString [
	aString = 'funguicida'
		ifTrue: [ ^ 'fungicida' ].
	aString = 'antidoto de herbicida'
		ifTrue: [ ^ 'antídoto de herbicida' ].
	aString = 'trat de suelos'
		ifTrue: [ ^ 'tratamiento de suelos' ].
	aString = 'tratamiento semillas'
		ifTrue: [ ^ 'tratamiento de semillas' ].
	aString = 'tormiquicida'
		ifTrue: [ ^ 'tormiguicida' ].
	^ aString
]

{ #category : #'608' }
SenasaCsvToDictionariesTransformer >> fromRes608Year2012Stream: aReadStream [
	"Produce jSon from an untouched CSV file corresponding to resolucion 608 of 2012 (minor crops)"

	| rows |
	rows := (NeoCSVReader on: aReadStream)
		skip;
		skip;
		upToEnd.
	^ rows flatCollect: [ :row | self dictionaryFrom608Year2012Row: row ]
]

{ #category : #'934' }
SenasaCsvToDictionariesTransformer >> fromRes934Year2010Stream: aReadStream [
	"Produce jSon from an untouched CSV file corresponding to resolucion 934 of 2010"

	| rows |
	rows := (NeoCSVReader on: aReadStream)
		skip;
		upToEnd.
	^ rows collect: [ :row | self dictionaryFrom934Year2010Row: row ]
]

{ #category : #common }
SenasaCsvToDictionariesTransformer >> residueFromString: each [
	^ [ each asLowercase trimBoth asNumber ]
		on: Error
		do: [ nil ]
]
