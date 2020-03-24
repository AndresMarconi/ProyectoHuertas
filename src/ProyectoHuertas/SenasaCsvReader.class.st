"
-
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
	^ rows flatCollect: [ :row | self recordsFrom608Year2012Row: row ]
]

{ #category : #'934' }
SenasaCsvReader >> fromRes934Year2010Stream: aReadStream [
	"Produce jSon from an untouched CSV file corresponding to resolucion 934 of 2010"

	| rows |
	rows := (NeoCSVReader on: aReadStream)
		skip;
		upToEnd.
	^ rows collect: [ :row | self recordFrom934Year2010Row: row ]
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

{ #category : #'934' }
SenasaCsvReader >> recordFrom934Year2010Row: row [
	^ SenasaRecord new
		cropVulgarName:
			(row third
				ifNil: [  ]
				ifNotNil: [ :it | it asLowercase trimBoth capitalized ]);
		activeIngredientTradeName: (row first ifNil: [  ] ifNotNil: [ :it | it asLowercase trimBoth ]);
		applicabilities:
			(row second
				ifNil: [ #() ]
				ifNotNil: [ :it | self applicabilitiesFor934Value: it ]);
		residue: (self residueFromString: row fourth);
		yourself
]

{ #category : #'608' }
SenasaCsvReader >> recordsFrom608Year2012Row: row [
	| activePrinciples records residues |
	records := OrderedCollection new.
	activePrinciples := (row third splitOn: $+)
		collect: [ :each | each asLowercase trimBoth ].
	residues := ((row at: 10) splitOn: $+)
		collect: [ :each | self residueFromString: each ].
	activePrinciples
		with: residues
		do: [ :principle :residue | 
			records
				add:
					(SenasaRecord new
						cropVulgarName: row first trimBoth asLowercase capitalized;
						activeIngredientTradeName: principle;
						applicabilities: (self applicability608For: row second);
						residue: residue;
						yourself) ].
	^ records
]

{ #category : #common }
SenasaCsvReader >> residueFromString: each [
	^ [ each asLowercase trimBoth asNumber ]
		on: Error
		do: [ nil ]
]
