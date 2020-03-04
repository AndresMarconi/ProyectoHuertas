"
To load the information of SENASA Excel sheet evaluate the next expresion on a playground

|loader|
loader:= FOMActiveIngredientLoader new.
loader loadActiveIngredients.
loader loadCrops.
loader loadWhiteListToCrops
"
Class {
	#name : #FOMActiveIngredientLoader,
	#superclass : #Object,
	#instVars : [
		'activeIngredients',
		'cultivars',
		'whiteListItems'
	],
	#category : #'ProyectoHuertas-example-data'
}

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> createCollectionOfActiveIngredients [
	| json |
json :=	(NeoJSONReader on: ' [ "1,3 Diclopropeno",
"1,4 diaminobutano",
"2,4 -  DB",
"2,4-D",
"6 BENCIL ADENINA",
"ABAMECTINA/AVERMECTINA",
"ACEFATO",
"ACEITE DE ARBOL DEL TE",
"ACEITE DE CREOSOTA",
"ACEITE DE SOJA",
"ACEITE ESCENCIAL DE AJO",
"ACEITE MINERAL / ACEITE MINERAL BLANCO",
"ACEQUINOCYL",
"ACETAMIPRID",
"ACETATO DE AMONIO",
"ACETOCLOR",
"ACIDO ARSANILICO",
"ACIDO BETA NAFTOXIACETICO",
"ACIDO BORICO",
"ACIDO CACODILICO",
"ACIDO CITRICO",
"ACIDO FOSFORICO",
"ACIDO GIBERELICO/ GIBERELINA A3",
"ACIDO GRASO METACLORO",
"ACIDO INDOL 3 BUT�RICO",
"ACIDO ORTOFOSFORICO",
"ACIDO PROPIONICO",
"ACIRFLUORFEN SODICO",
"ACLONIFEN",
"ACRINATRINA",
"ACROLEINA",
"ALACLOR",
"ALCOHOL ALCOXILADO",
"ALCOHOL ETOXILADO",
"ALCOHOLES GRASOS",
"ALFA NAFTALEN ACETATO DE SODIO",
"ALFACIPERMETRINA/ALFAMETRINA",
"ALQUIL FENOL ETOXILADO",
"AMETOCTRADIN",
"AMETRINA",
"AMICARBAZONE",
"AMINA GRASA ETOXILADA",
"AMINOETOXIVINILGLICINA",
"AMINOPYRALID",
"AMINOTRIAZOL",
"AMISULBRON",
"AMITRAZ",
"AMONIO CUATERNARIO",
"ASULAM",
"ATRAZINA",
"AZADIRACTINA",
"AZOXISTROBINA",
"AZOXISTROBINA",
"AZUFRE",
"BACILLUS SUBTILIS",
"BACILLUS THURINGIENSIS",
"BEAUVERIA BASSIANA",
"BENALAXIL",
"BENAZOLIN ETIL",
"BENFURACARB",
"BENOMIL",
"BENTAZON",
"BENZOATO DE EMAMECTINA",
"BENZOVINDIFLUPIR",
"BETACIFLUTRIN",
"BETACIPERMETRINA",
"BETACIPERMETRINA",
"BICICLOPIRONA",
"BIFENAZATE",
"BIFENTRIN",
"BISPIRIBAC  SODICO",
"BISTRIFLUR�N",
"BIXAFEN",
"BOSCALID",
"BRODIFACOUM",
"BROMACIL",
"BROMADIOLONE",
"BROMOPROPILATO",
"BROMOXINIL",
"BROMURO DE METILO",
"BUPIRIMATO",
"BUPROFEZIN",
"BUTAFENACIL",
"BUTRALIN",
"CAOLIN",
"CAOLINITA",
"CAPTAN",
"CARBARIL",
"CARBENDAZIM",
"CARBOFURAN",
"CARBONATO BASICO DE CU",
"CARBOXIN",
"CARFENTRAZONE ETIL",
"CARTAP",
"CIALOFOP BUTIL",
"CIANAMIDA HIDROGENADA",
"CIPERMETRINA",
"CLETODIM",
"CLODINAFOP  PROPARGIL",
"CLOFENTEZINE",
"CLOMAZONE",
"CLOPIRALID",
"CLOQUINTOCET MEXYL",
"CLORANSULAM  METIL",
"CLORANTRANILIPROLE",
"CLORFENAPIR",
"CLORFLUAZURON",
"CLORIDAZON / PIRAZON",
"CLORIMURON  ETIL",
"CLOROMECUATO",
"CLOROPICRINA",
"CLOROTALONIL",
"CLORPIRIFOS  METIL",
"CLORPIRIFOS ETIL/CLORPIRIFOS",
"CLORPROFAM / C.I.P.C",
"CLORSULFURON",
"CLOTHIANIDIN",
"CUMETETRALIL",
"CYANTRANILIPROLE (CYAZYPYR)",
"CYAZOFAMID",
"CYCLANILIDE",
"CYFLUTRIN / CYFLUTRINA",
"CYHEXATIN",
"CYFLUMETOFEN",
"CYMOXANIL",
"CYPROCONAZOLE",
"CYPRODINIL",
"CYPROSULFAMIDE",
"DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
"DAMINOZINE",
"DAZOMET",
"DELTAMETRINA / DECAMETRINA",
"DIALURIN ESTER + POLIET. GLICOL ESTER",
"DICAMBA",
"DICLOFO  METIL",
"DICLOFOP  METIL",
"DICLORPROP  / 2,4 DP",
"DICLOSULAM",
"DIFENILAMINA",
"DIFENOCONAZOLE",
"DIFETIALONE",
"DIFLUBENZURON",
"DIFLUFENICAN",
"DIMETENAMIDA",
"DIMETIL DISULFURO",
"DIMETIPHIN",
"DIMETOATO",
"DIMETOMORF",
"DIMETSULFURON  / NICOSULFURON",
"DIMOXISTROBIN",
"DINICONAZOLE",
"DINOTEFURAN",
"DIQUAT DIBROMURO",
"DITIANON",
"DIURON",
"DODECADIENOL",
"DODECENILACETATO",
"DODECIL BENCENO SULF TRIETANOLAMIDA",
"EPOXICONAZOLE",
"ESFENVALERATO",
"ESTER METILICO DE ACEITES VEGETALES",
"ESTER POLIGLICOL DE ACIDOS GRASOS",
"ETEFON",
"ETHABOXAM",
"ETHIPROLE",
"ETION",
"EXTRACTO DE AJO",
"FAMOXADONE",
"FENAMIFOS",
"FENARIMOL",
"FENAZAQUIN",
"FENBUCONAZOLE",
"FENBUTATIN OXIDO",
"FENHEXAMID",
"FENITROTION",
"FENMEDIFAN",
"FENOXAPROP ETIL",
"FENPIROXIMATO",
"FENPROPATRINA",
"FENTION",
"FENTOATO",
"FENVALERATO",
"FERBAM",
"FIPRONIL",
"FLAZASULFURON",
"FLONICAMID",
"FLORPYRAUXIFEN ETIL",
"FLUAZIFOP- P- BUTIL",
"FLUAZINAM",
"FLUBENDIAMIDE",
"FLUCARBAZONE",
"FLUDIOXONIL",
"FLUFENACET",
"FLUFENOXURON",
"FLUMETRALIN",
"FLUMETSULAM",
"FLUMICLORAC PENTIL",
"FLUMIOXAZIM",
"FLUOMETURON",
"FLUOPICOLIDE",
"FLUOROCLORIDONA",
"FLUOXASTROBIN",
"FLUQUINCONAZOLE",
"FLUROXIPIR",
"FLUSILAZOLE",
"FLUTRIAFOL",
"FLUXAPYROXAD",
"FLUXOFENIM",
"FOLCISTEINA",
"FOLPET",
"FOMESAFEN",
"FORAMSULFURON",
"FORMETANATO",
"FOSETIL ALUMINIO",
"FOSFINA",
"FOSMET",
"FOSTIAZATE",
"GAMACIALOTRINA / LAMBDACIALOTRINA",
"GIBERELINAS A4 A7",
"GLANDLURE",
"GLIFOSATO / GLIFOSATO ACIDO",
"GLUFOSINATO DE AMONIO",
"GUAZATINE",
"HALOSULFURON",
"HALOSULFURON METIL",
"HALOXYFOP-P- METIL  ESTER",
"HEPTAMETILTRISILOXANO",
"HEXACONAZOLE",
"HEXAZINONA",
"HEXITIAZOX",
"HIDRAZIDA MALEICA",
"HIDROXICLORURO DE TRIMETILAMINA",
"HIDROXIDO DE COBRE",
"IMAZALIL",
"IMAZAMOX",
"IMAZAPIC",
"IMAZAPIR", 
"IMAZAQUIN",
"IMAZETAPIR",
"IMIDACLOPRID",
"INDAZIFLAM",
"INDOXACARB",
"IODOSULFURON  METIL SODIO",
"IOXINIL OCTANOATO",
"IPOCONAZOLE",
"IPRODIONE",
"IPROVALICARB",
"ISOPYRAZAM",
"ISOXAFLUTOLE",
"KASUGAMICINA",
"KINETINA",
"KRESOXIM  METIL",
"LACTOFEN",
"LECITINA DE SOJA",
"LENACIL",
"LIGNOSULFONATO DE CALCIO",
"LINURON",
"LUFENURON",
"M.C.P.A.",
"M.S.M.A.",
"MANCOZEB",
"MANDIPROPAMID",  
"MEPIQUAT CLORURO",
"MEPTYL DINOCAP",
"MERCAPTOTION / MALATION",
"MESOTRIONE",
"METABENZTIAZURON",
"METAFLUMIZONE",
"METALAXIL",
"METALAXIL ? M -ISOMERO",
"METALDEHIDO",
"METAM POTASIO",
"METAM SODIO",
"METAMITRON",
"METCONAZOLE",
"METIDATION",
"METIL TIOFANATO",
"METILCICLOPROPENO",
"METIOCARB / METMERCAPTURON",
"METIRAM",
"METOLACLORO / S- METOLACLORO",
"METOMIL",
"METOMINOSTROBIN",
"METOXIFENOCIDE",
"METRAFENONE",
"METRIBUZIN",
"METSULFURON   METIL",
"MEZCLA DE ESTERES DE ACIDOS GRASOS DE ACEITES VEGETALES",
"MEZCLA DE ESTERES DE ALQUIL FENOL Y POLIETILENGLICOL",
"MEZCLA DE ESTERES Y JABONES PROVENIENTES DE �CIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLIC�RIDOS.",
"MOLINATE",
"MYCLOBUTANIL",
"NAFTENO DE ZINC",
"NAPROPAMIDA",
"NAPTALAN",
"NONIL FENOL ETOXILADO",
"NOVALURON",
"OCTIFENOL Y POLIETILENGLICOL",
"OLEATO DE ETILO",
"OLEATO DE POTASIO",
"ORTOFENILFENATO  DE SODIO",
"ORYZALIN",
"OXADIAZON",
"OXASULFURON",
"OXATHIAPIPROLIN",
"OXICLORURO DE COBRE",
"OXIDO CUPROSO",
"OXIDO DE COCOAMIDA PROPIL",
"OXIFLUORFEN",
"OXITETRACICLINA",
"OXITETRACICLINA CLORHIDRATO",
"P.C.N.B.",
"PARAQUAT  (Dicloruro)",
"PENCONAZOLE",
"PENCYCURON",
"PENDIMETALIN",
"PENOXULAM",
"PENTIOPIRAD",
"PERMETRINA",
"PICLORAN",
"PICOXYSTROBIN",
"PINOXADEN",
"PIRAFLUFEN ETIL",
"PIRETRINAS",
"PIRIDAFENTION",
"PIRIMICARB",
"PIRIMIFOS  METIL",
"PIROXASULFONE",
"POLIOXI ESTER AMINO GRASO",
"POLISULFURO DE CALCIO",
"POLYPHASE",
"PRIMISULFURON",
"PROCIMIDONE",
"PROCLORAZ",
"PROFENOFOS",
"PROFOXIDIM /CLEFOXIDIM",
"PROMETRINA",
"PROPAMOCARB  CLORHIDRATO",
"PROPANIL",
"PROPAQUIZAFOP",
"PROPARGITE",
"PROPICONAZOLE",
"PROPINEB",
"PROPIZAMIDA",
"PROSULFURON",
"PROTHIOCONAZOLE",
"PYDIFLUMETOFEN",
"PYMETROZINE",
"PYRACLOSTROBIN",
"PYRIMETANIL",
"PYRIPROXYFEN",
"PYRlDABEN",
"PYROXSULAM",
"QUINCLORAC",
"QUINOXYFEN",
"QUITOSANO",
"QUIZALOFOP - ETIL /ACIPROFEN ETIL",
"QUIZALOFOP- P- TEFURIL",
"RIANODINA",
"RIMSULFURON",
"SAFLUFENACIL",
"SALES CCA",
"SAPONINAS",
"SEDAXANE",
"SERRICORNIN",
"SETHOXIDIM",
"SIMAZINA",
"SPINETORAM",
"SPINOSAD",
"SPIRODICLOFEN",
"SPIROMESIFEN",
"SPIROTETRAMAT",
"SULFATO CUPRICO PENTAHIDRATADO",
"SULFATO DE AMONIO",
"SULFATO DE ESTREPTOMICINA",
"SULFATO DE GENTAMICINA",
"SULFATO NEUTRO DE OXIQUINOL",
"SULFATO TETRACUPICO TRICALCICO",
"SULFATO TRIB�SICO DE COBRE",
"SULFENTRAZONE",
"SULFLURAMIDA",
"SULFOMETUR�N METIL",
"SULFOXAFLOR",
"TEBUCONAZOLE /  FENETRAZOLE",
"TEBUFENOZIDE",
"TEBUTIURON",
"TEFLUBENZURON",
"TEFLUTRINA",
"TEMBOTRIONE",
"TERBACIL",
"TERBUTILAZINA",
"TERBUTRINA",
"TETRACONAZOLE",
"TETRADIFON",
"THIENCARBAZONE METIL",
"TIABENDAZOL",
"TIACLOPRID",
"TIADIAZURON",
"TIAMETOXAM",
"TIERRA DE DIATOMEAS",
"TIFENSULFURON METIL",
"TIODICARB",
"TIRAM",
"TOLCLOROS METIL",
"TOLPYRALATE",
"TOLYFLUANID",
"TOPRAMEZONE",
"TRALKOXYDIM",
"TRIADIMEFON",
"TRIADIMENOL",
"TRIASULFURON",
"TRIBROMO FENATO DE SODIO",
"TRIBROMO FENOL",
"TRIBUFOS",
"TRICHODERMA",
"TRICLOPYR",
"TRIFENIL ACETATO DE ESTA�O",
"TRIFLOXISTROBIN",
"TRIFLOXISULFURON",
"TRIFLUMURON",
"TRIFLURALINA",
"TRIFORINE",
"TRINEXAPAC ETIL",
"TRITICONAZOLE",
"VALIPHENAL",
"VIRUS DE LA GRANULOSIS DE CYDIA",
"ZETAMETRINA",
"ZINEB",
"ZIRAM",
"ZOXAMIDE",
"ZIRAM",
"ZOXAMIDE"] ' readStream)
   listClass: OrderedCollection.
activeIngredients := json next
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> createCollectionOfCultivar [
	| json |
json :=	(NeoJSONReader on: ' [ "Acelga",
"Achicoria",
"Ají",
"Ajo",
"Ajo (bulbo)",
"Albahaca",
"Apio",
"Batata",
"Berenjena",
"Berro",
"Brócoli",
"Bulbos, estacas destinadas a plantacion",
"Calabaza",
"Cardo",
"Cebolla",
"Cebolla (consumo)",
"Chaucha",
"Cilantro",
"Col",
"Coliflor",
"Colinabo",
"Colza",
"Endivia",
"Eneldo",
"Escarola",
"Espárrago",
"Espárrago (consumo)",
"Espárrago (para propagación)",
"Espinaca",
"Florales y ornamentales",
"Frambuesa",
"Frutilla",
"Grosella",
"Hinojo",
"Lechuga",
"Manzana (Red Delicius)",
"Menta",
"Nabo",
"Orégano",
"Papa",
"Papa (papa semilla)",
"Pepino",
"Pepino Dulce *",
"Pera",
"Perejil",
"Pimiento",
"Puerro",
"Rábano",
"Radiccio",
"Radicheta",
"Remolacha",
"Remolacha (hojas)",
"Remolacha (raíz)",
"Repollito de Bruselas",
"Repollo",
"Romero",
"Rúcula",
"Salvia",
"Sandía",
"Tomate",
"Tomillo",
"Zanahoria",
"Zapallito de tronco",
"Zapallo",
"Zapallo (Calabaza)" ] ' readStream)
   listClass: OrderedCollection.
cultivars := json next
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> createWhitelist [

^'
{
    "Pimiento": [
        {
            "principio activo": "Metam sodio",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Bromuro de metilo",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Abamectina",
            "residuos": "0.01",
            "carencia": "3"
        },
        {
            "principio activo": "Acetamiprid",
            "residuos": "0.1",
            "carencia": "1"
        },
        {
            "principio activo": "Aldicarb",
            "residuos": "0.01",
            "carencia": "60"
        },
        {
            "principio activo": "Azadiractina",
            "residuos": "Exento",
            "carencia": "3"
        },
        {
            "principio activo": "Azoxistrobina",
            "residuos": "0.15",
            "carencia": "3"
        },
        {
            "principio activo": "Azufre",
            "residuos": "Exento",
            "carencia": "7"
        },
        {
            "principio activo": "Captan",
            "residuos": "15",
            "carencia": "7"
        },
        {
            "principio activo": "Carbendazim",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Clorotalonil",
            "residuos": "5",
            "carencia": "7"
        },
        {
            "principio activo": "Clorpirifos",
            "residuos": "0.5",
            "carencia": "21"
        },
        {
            "principio activo": "cyantraniliprole",
            "residuos": "3",
            "carencia": "1"
        },
        {
            "principio activo": "Cyazypyr",
            "residuos": "3",
            "carencia": "1"
        },
        {
            "principio activo": "Deltametrina",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Difenoconazole",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Etefon",
            "residuos": "2",
            "carencia": "sin datos"
        },
        {
            "principio activo": "Fenamifos",
            "residuos": "0.1",
            "carencia": "90"
        },
        {
            "principio activo": "Flubendiamide",
            "residuos": "0.5",
            "carencia": "5"
        },
        {
            "principio activo": "Folpet",
            "residuos": "2",
            "carencia": "7"
        },
        {
            "principio activo": "Formetanato",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Fosetil Aluminio",
            "residuos": "0.05",
            "carencia": "15"
        },
        {
            "principio activo": "Gammacialotrina",
            "residuos": "0.04",
            "carencia": "1"
        },
        {
            "principio activo": "Hidroxido de cobre",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Imidacloprid",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Kasugamicina",
            "residuos": "0.04",
            "carencia": "1"
        },
        {
            "principio activo": "Lambdacialotrina",
            "residuos": "0.04",
            "carencia": "1"
        },
        {
            "principio activo": "Mancozeb",
            "residuos": "3",
            "carencia": "7"
        },
        {
            "principio activo": "Metamidofos",
            "residuos": "0.5",
            "carencia": "14"
        },
        {
            "principio activo": "Metil azinfos",
            "residuos": "0.5",
            "carencia": "20"
        },
        {
            "principio activo": "Metiocarb",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Metolacloro",
            "residuos": "0.05",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Metomil",
            "residuos": "0.1",
            "carencia": "10"
        },
        {
            "principio activo": "Napropamida",
            "residuos": "0.01",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Oxicloruro de cobre",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Oxido cuproso",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Picoxystrobin",
            "residuos": "0.5",
            "carencia": "1"
        },
        {
            "principio activo": "Piridaben",
            "residuos": "0.7",
            "carencia": "7 a 15"
        },
        {
            "principio activo": "Pirimicarb",
            "residuos": "0.5",
            "carencia": "5"
        },
        {
            "principio activo": "Polisulfuro de calcio",
            "residuos": "Exento",
            "carencia": "7"
        },
        {
            "principio activo": "Procimidone",
            "residuos": "2",
            "carencia": "7"
        },
        {
            "principio activo": "Prometrina",
            "residuos": "0.2",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Propamocarb",
            "residuos": "1.5",
            "carencia": "3"
        },
        {
            "principio activo": "Setoxidim",
            "residuos": "1",
            "carencia": "15"
        },
        {
            "principio activo": "Spirotetramat",
            "residuos": "0.1",
            "carencia": "sin datos"
        },
        {
            "principio activo": "Tebuconazole",
            "residuos": "0.1",
            "carencia": "30"
        },
        {
            "principio activo": "Tebuconazole",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Trifluralina",
            "residuos": "0.05",
            "carencia": "30"
        },
        {
            "principio activo": "Zineb",
            "residuos": "3",
            "carencia": "15"
        },
        {
            "principio activo": "Ziram",
            "residuos": "3",
            "carencia": "7"
        }
    ],
    "Berenjena": [
        {
            "principio activo": "Metam sodio",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Bromuro de metilo",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Azufre",
            "residuos": "Exento",
            "carencia": "7"
        },
        {
            "principio activo": "Captan",
            "residuos": "15",
            "carencia": "7"
        },
        {
            "principio activo": "Carbendazim",
            "residuos": "0.5",
            "carencia": "7"
        },
        {
            "principio activo": "Clorotalonil",
            "residuos": "1",
            "carencia": "7"
        },
        {
            "principio activo": "Deltametrina",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Gammacialotrina",
            "residuos": "0.02",
            "carencia": "1"
        },
        {
            "principio activo": "Hexitiazox",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Imidacloprid",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Lambdacialotrina",
            "residuos": "0.02",
            "carencia": "1"
        },
        {
            "principio activo": "Metolacloro",
            "residuos": "0.05",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Oxicloruro de cobre",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Pirimicarb",
            "residuos": "0.5",
            "carencia": "5"
        },
        {
            "principio activo": "Polisulfuro de calcio",
            "residuos": "Exento",
            "carencia": "7"
        },
        {
            "principio activo": "Procimidone",
            "residuos": "2",
            "carencia": "7"
        },
        {
            "principio activo": "Setoxidim",
            "residuos": "1",
            "carencia": "15"
        },
        {
            "principio activo": "Zineb",
            "residuos": "3",
            "carencia": "15"
        }
    ],
    "Tomate": [
        {
            "principio activo": "Metam sodio",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Bromuro de metilo",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Dicloropropeno + Cloropicrina",
            "residuos": "exento",
            "carencia": "antes de siembra"
        },
        {
            "principio activo": "Abamectina",
            "residuos": "0.01",
            "carencia": "3"
        },
        {
            "principio activo": "Acetamiprid",
            "residuos": "0.1",
            "carencia": "1"
        },
        {
            "principio activo": "Aldicarb",
            "residuos": "0.01",
            "carencia": "60"
        },
        {
            "principio activo": "Azadiractina",
            "residuos": "exento",
            "carencia": "3"
        },
        {
            "principio activo": "Azociclotin",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Azoxistrobina",
            "residuos": "0.5",
            "carencia": "3"
        },
        {
            "principio activo": "Azufre",
            "residuos": "Exento",
            "carencia": "7"
        },
        {
            "principio activo": "Benomil",
            "residuos": "2.5",
            "carencia": "20"
        },
        {
            "principio activo": "Benzoato de emamectina",
            "residuos": "0.02",
            "carencia": "1"
        },
        {
            "principio activo": "Bifentrin",
            "residuos": "0.05",
            "carencia": "7"
        },
        {
            "principio activo": "Buprofezim",
            "residuos": "0.3",
            "carencia": "4"
        },
        {
            "principio activo": "Captan",
            "residuos": "15",
            "carencia": "7"
        },
        {
            "principio activo": "Carbendazim",
            "residuos": "1",
            "carencia": "7"
        },
        {
            "principio activo": "Carbofuran",
            "residuos": "0.1",
            "carencia": "60"
        },
        {
            "principio activo": "Cartap",
            "residuos": "0.01",
            "carencia": "14"
        },
        {
            "principio activo": "Chlorantranilipole",
            "residuos": "0.3",
            "carencia": "1"
        },
        {
            "principio activo": "Cipermetrina",
            "residuos": "1",
            "carencia": "21"
        },
        {
            "principio activo": "clorfenapir",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Clorfluazurón",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Cloromecuato",
            "residuos": "0.05",
            "carencia": "sin datos"
        },
        {
            "principio activo": "Clorotalonil",
            "residuos": "5",
            "carencia": "7"
        },
        {
            "principio activo": "Clorpirifos",
            "residuos": "0.5",
            "carencia": "21"
        },
        {
            "principio activo": "cyantraniliprole",
            "residuos": "1.5",
            "carencia": "1"
        },
        {
            "principio activo": "Cyazypyr",
            "residuos": "1.5",
            "carencia": "1"
        },
        {
            "principio activo": "Deltametrina",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Difenoconazole",
            "residuos": "0.15",
            "carencia": "3"
        },
        {
            "principio activo": "Dimetoato",
            "residuos": "1",
            "carencia": "14"
        },
        {
            "principio activo": "Etefon",
            "residuos": "2",
            "carencia": "sin datos"
        },
        {
            "principio activo": "Fenamifos",
            "residuos": "0.1",
            "carencia": "90"
        },
        {
            "principio activo": "Fluazifop-p-Butil",
            "residuos": "0.1",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Flubendiamide",
            "residuos": "0.5",
            "carencia": "5"
        },
        {
            "principio activo": "Folpet",
            "residuos": "2",
            "carencia": "7"
        },
        {
            "principio activo": "Formetanato",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Fosetil Aluminio",
            "residuos": "0.05",
            "carencia": "15"
        },
        {
            "principio activo": "Gammacialotrina",
            "residuos": "0.07",
            "carencia": "1"
        },
        {
            "principio activo": "Giberelina A3",
            "residuos": "0.15",
            "carencia": "20"
        },
        {
            "principio activo": "Hexitiazox",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Hidroxido de cobre",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Imidacloprid",
            "residuos": "0.1",
            "carencia": "3"
        },
        {
            "principio activo": "Indoxacarb",
            "residuos": "0.5",
            "carencia": "1"
        },
        {
            "principio activo": "Kasugamicina",
            "residuos": "0.03",
            "carencia": "1"
        },
        {
            "principio activo": "Lambdacialotrina",
            "residuos": "0.7",
            "carencia": "1"
        },
        {
            "principio activo": "Linuron",
            "residuos": "0.05",
            "carencia": "60"
        },
        {
            "principio activo": "Lufenuron",
            "residuos": "0.02",
            "carencia": "7"
        },
        {
            "principio activo": "Mancozeb",
            "residuos": "3",
            "carencia": "7"
        },
        {
            "principio activo": "Mercaptotion",
            "residuos": "3",
            "carencia": "3"
        },
        {
            "principio activo": "Metamidofos",
            "residuos": "0.01",
            "carencia": "14"
        },
        {
            "principio activo": "Metidation",
            "residuos": "0.1",
            "carencia": "5"
        },
        {
            "principio activo": "Metil azinfos",
            "residuos": "0.5",
            "carencia": "20"
        },
        {
            "principio activo": "Metolacloro",
            "residuos": "0.05",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Metomil",
            "residuos": "0.1",
            "carencia": "10"
        },
        {
            "principio activo": "Metoxifenocide",
            "residuos": "0.2",
            "carencia": "1"
        },
        {
            "principio activo": "Metribuzin",
            "residuos": "0.1",
            "carencia": "60"
        },
        {
            "principio activo": "Napropamida",
            "residuos": "0.01",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Novaluron",
            "residuos": "0.5",
            "carencia": "1"
        },
        {
            "principio activo": "Oxicloruro de cobre",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Oxido cuproso",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Pendimetalin",
            "residuos": "0.05",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Picoxystrobin",
            "residuos": "0.5",
            "carencia": "1"
        },
        {
            "principio activo": "Piridaben",
            "residuos": "0.1",
            "carencia": "7 a 15"
        },
        {
            "principio activo": "Polisulfuro de calcio",
            "residuos": "Exento",
            "carencia": "7"
        },
        {
            "principio activo": "Procimidone",
            "residuos": "2",
            "carencia": "7"
        },
        {
            "principio activo": "Prometrina",
            "residuos": "0.2",
            "carencia": "Sin datos"
        },
        {
            "principio activo": "Propamocarb",
            "residuos": "0.3",
            "carencia": "3"
        },
        {
            "principio activo": "Propineb",
            "residuos": "3",
            "carencia": "7"
        },
        {
            "principio activo": "Pymetrozine",
            "residuos": "0.5",
            "carencia": "3"
        },
        {
            "principio activo": "Pyriproxyfen",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Rynaxypyr",
            "residuos": "0.3",
            "carencia": "1"
        },
        {
            "principio activo": "Setoxidim",
            "residuos": "1",
            "carencia": "15"
        },
        {
            "principio activo": "Spinosad",
            "residuos": "0.03",
            "carencia": "3"
        },
        {
            "principio activo": "Spirotetramat",
            "residuos": "1",
            "carencia": "sin datos"
        },
        {
            "principio activo": "Sulfato de cobre",
            "residuos": "10",
            "carencia": "14"
        },
        {
            "principio activo": "Tebuconazole",
            "residuos": "0.1",
            "carencia": "30"
        },
        {
            "principio activo": "Tebuconazole",
            "residuos": "0.1",
            "carencia": "7"
        },
        {
            "principio activo": "Teflubenzuron",
            "residuos": "1",
            "carencia": "sin datos"
        },
        {
            "principio activo": "Teflubenzuron",
            "residuos": "1",
            "carencia": "7"
        },
        {
            "principio activo": "tiacloprid",
            "residuos": "0.5",
            "carencia": "7"
        },
        {
            "principio activo": "Tiametoxam",
            "residuos": "0.2",
            "carencia": "3"
        },
        {
            "principio activo": "Triadimefon",
            "residuos": "0.2",
            "carencia": "7"
        },
        {
            "principio activo": "Triflumuron",
            "residuos": "0.02",
            "carencia": "7"
        },
        {
            "principio activo": "Trifluralina",
            "residuos": "0.05",
            "carencia": "30"
        },
        {
            "principio activo": "Zineb",
            "residuos": "3",
            "carencia": "15"
        },
        {
            "principio activo": "Ziram",
            "residuos": "3",
            "carencia": "7"
        }
    ]
}
'
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> findActiveIngredient: tradeName [

^(ActiveIngredient selectAll) detect: [ :each | each tradeName = (tradeName asUppercase ) ] ifNone: [ ^nil ]    
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> findCrop: vulgarName [

^(Crop selectAll) detect: [ :each | each vulgarName = vulgarName ]
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> getJsonOf: stringJson [
| json |
	json :=	(NeoJSONReader on: self createWhitelist readStream)
   		listClass: OrderedCollection.
 	^json next
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> initialize [
	self createCollectionOfActiveIngredients.
	self createCollectionOfCultivar.
	self createCollectionOfWhiteListItems.
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> loadActiveIngredients [
	| actIng |
	activeIngredients do: [ :each | actIng := ActiveIngredient ingredient: each URL: '-'. actIng save ]
	
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> loadCrops [
| crop |
{'Pimiento'.
'Berenjena'.
'Tomate'.
'Lechuga'.
'Acelga'.			
'Apio'.
'Puerro'.
'Zapallito de tronco'.
'Brocoli'.
'Remolacha'.
'Espinaca'.
'Pepino'.
'Batata'}	 do: [ :each | crop:= Crop name: each yield: 0. crop save ]
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> loadWhiteListToCrops [
	|crops names|
	crops:= self getJsonOf: self createWhitelist.
	names:= crops keys.
	names do: [ :each | 
		self makeWhiteList2Of: (self findCrop: each) 
		with: (crops at: each) ].

	
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> loadWhiteListToCultivars [
	|cultiv|
	cultiv:= Crop selectAll.
	cultiv do: [ :each | self makeWhiteListOf: each with: (self whiteListItemsOf: each) ]
	
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> makeWhiteList2Of: cultivar with: whiteListItemsAsDic [
	| whiteListItem actIng|
	whiteListItemsAsDic do: [ :each | 
		actIng:= self findActiveIngredient: (each at: 'principio activo').
		actIng ifNotNil: [ 
			whiteListItem:= WhiteListItem new.
			whiteListItem 
				activeIngredient: actIng;
				aptitud: '-';
				waste: (each at: 'residuos' ifAbsent: [ ' ' ]);
				waitingPeriod: (each at: 'carencia' ifAbsent: [ ' ' ]).
			cultivar addIngredient: whiteListItem.
			whiteListItem save. ] ].
	cultivar save.
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> makeWhiteListOf: cultivar with: whiteListItemsAsDic [
	| whiteListItem |
	whiteListItemsAsDic do: [ :each | 
		whiteListItem:= WhiteListItem new.
		whiteListItem 
			activeIngredient: (each at: 'Principio activo' ifAbsent: [ ' ' ]);
			aptitud: (each at: 'Aptitud' ifAbsent: [ ' ' ]);
			waste: (each at: 'Residuos (mg /Kg)' ifAbsent: [ ' ' ]);
			waitingPeriod: 0.
		cultivar addIngredient: whiteListItem.
		whiteListItem save.	].
	cultivar save.
]

{ #category : #accessing }
FOMActiveIngredientLoader >> whiteList [ 
	^ whiteListItems.
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> whiteListItemsOf: cultivar [
	^ whiteListItems select: [ :each | (each at: 'Cultivos' ifAbsent: [ ' ' ]) = cultivar vulgarName ]
]
