"
Produces JSON of the form: 
 
[{ ""crop"" : ""Tomate"",
   ""ingredient"" : ""clofentezine"",
   ""applicabilities"" : [""Insecticida"",""Fungicida""],
   ""residue"" : 3 }]
"
Class {
	#name : #SenasaCsvReader,
	#superclass : #Object,
	#category : #'ProyectoHuertas-senasa'
}

{ #category : #constants }
SenasaCsvReader class >> normalizedApplicabilities [
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
SenasaCsvReader class >> res608year12 [
	^ self new
		fromRes608Year2012Stream: FOMLibrary new res60812anexoCsv readStream
]

{ #category : #data }
SenasaCsvReader class >> res934year10 [
	^ self new
		fromRes934Year2010Stream: FOMLibrary new res93410anexoCsv readStream
]

{ #category : #'934' }
SenasaCsvReader >> applicabilitiesFor934Value: aString [
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
SenasaCsvReader >> applicability608For: aString [
	^ Set
		with: (self problems608ToApplicabilitiesMapping at: aString asLowercase)
]

{ #category : #'608' }
SenasaCsvReader >> dictionaryFrom608Year2012Row: row [
	| activePrinciples dictionaries residues |
	dictionaries := OrderedCollection new.
	activePrinciples := (row third splitOn: $+)
		collect: [ :each | each asLowercase trimBoth ].
	residues := ((row at: 10) splitOn: $+)
		collect: [ :each | self residueFromString: each ].
	activePrinciples
		with: residues
		do: [ :principle :residue | 
			dictionaries
				add:
					(Dictionary new
						at: 'crop' put: row first trimBoth asLowercase capitalized;
						at: 'principle' put: principle;
						at: 'applicabilities'
							put: (self applicability608For: row second);
						at: 'residue' put: residue;
						yourself) ].
	^ dictionaries
]

{ #category : #'934' }
SenasaCsvReader >> dictionaryFrom934Year2010Row: row [
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
			(row second
				ifNil: [ #() ]
				ifNotNil: [ :it | self applicabilitiesFor934Value: it ]);
		at: 'residue' put: (self residueFromString: row fourth);
		yourself
]

{ #category : #'934' }
SenasaCsvReader >> expand934AbbreviationsIn: aString [
	^ self class normalizedApplicabilities
		at: aString
		ifAbsent: [ aString ]
]

{ #category : #'934' }
SenasaCsvReader >> fix934TyposIn: aString [
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
SenasaCsvReader >> fromRes608Year2012Stream: aReadStream [
	"Produce jSon from an untouched CSV file corresponding to resolucion 608 of 2012 (minor crops)"

	| rows |
	rows := (NeoCSVReader on: aReadStream)
		skip;
		skip;
		upToEnd.
	^ rows flatCollect: [ :row | self dictionaryFrom608Year2012Row: row ]
]

{ #category : #'934' }
SenasaCsvReader >> fromRes934Year2010Stream: aReadStream [
	"Produce jSon from an untouched CSV file corresponding to resolucion 934 of 2010"

	| rows |
	rows := (NeoCSVReader on: aReadStream)
		skip;
		upToEnd.
	^ rows collect: [ :row | self dictionaryFrom934Year2010Row: row ]
]

{ #category : #'608' }
SenasaCsvReader >> problems608ToApplicabilitiesMapping [
	^ {('mosca blanca' -> 'insecticida').
	('pulgones' -> 'insecticida').
	('arañuelas' -> 'acaricida').
	('lyriomiza' -> 'insecticida').
	('sclerotinia  ' -> 'fungicida').
	('botrytis cinerea' -> 'fungicida').
	('trips' -> 'insecticida').
	('orugas ' -> 'insecticida').
	('orugas defoliadoras' -> 'insecticida').
	('mildew' -> 'fungicida').
	('oidio' -> 'fungicida').
	('tizón' -> 'fungicida').
	('bacteriosis' -> 'fungicida').
	('vaquita de las coles' -> 'insecticida').
	('cercospora sp.' -> 'fungicida').
	('g. cortadores' -> 'insecticida').
	('peronospora' -> 'fungicida').
	('phythium' -> 'insecticida').
	('fusarium sp,' -> 'fungicida').
	('orugas' -> 'insecticida').
	('sclerotinia sp,' -> 'fungicida').
	('acaros' -> 'acaricida').
	('alternaria sp.' -> 'fungicida').
	('sclerotinia' -> 'fungicida').
	('antracnosis' -> 'fungicida').
	('spodoptera' -> 'insecticida').
	('chinches' -> 'insecticida').
	('hormigas' -> 'hormiguicida').
	('gusanos de suelo' -> 'insecticida').
	('gusano de la fruta' -> 'insecticida')} asDictionary
]

{ #category : #common }
SenasaCsvReader >> residueFromString: each [
	^ [ each asLowercase trimBoth asNumber ]
		on: Error
		do: [ nil ]
]
