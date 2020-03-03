"
To load the information of SENASA Excel sheet evaluate the next expresion on a playground

| loader |
	loader:= FOMActiveIngredientLoader.
	loader loadActiveIngredients.
	loader loadCultivars.
	loader loadWhiteListToCultivars.
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

{ #category : #accessing }
FOMActiveIngredientLoader >> activeIngredients [
	^ activeIngredients
]

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
FOMActiveIngredientLoader >> createCollectionOfWhiteListItems [
| json |
	json:= (NeoJSONReader on: ' 

	[
        {
            "Principio activo": "2,4 -  DB",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4 -  DB",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4 -  DB",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4 -  DB",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4 -  DB",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (forraje)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Mijo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Mijo (forraje)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas de gramíneas",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "2,4-D",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (forraje)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "6 BENCIL ADENINA",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "      Manzana (Red Delicius)                   ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "6 BENCIL ADENINA",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Ac - In - Ne - Tratamiento Semillas)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Ac - In - Ne - Tratamiento Semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Ac - In - Ne - Tratamiento Semillas)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ABAMECTINA/AVERMECTINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lino (Forraje) ",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEFATO ",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Sorgo, poroto, algodón, girasol, maiz",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE ARBOL DEL TE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE ARBOL DEL TE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE ARBOL DEL TE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE ARBOL DEL TE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE ARBOL DEL TE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE ARBOL DEL TE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE CREOSOTA",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE DE SOJA",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE ESCENCIAL DE AJO",
            "Aptitud": "(Repelente)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Palta",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEITE MINERAL / ACEITE MINERAL BLANCO",
            "Aptitud": "(Acaricida - Fungicida - Insecticida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACEQUINOCYL",
            "Aptitud": "(Acaricida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "ACEQUINOCYL",
            "Aptitud": "(Acaricida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "ACEQUINOCYL",
            "Aptitud": "(Acaricida)",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (Fibra)",
            "Residuos (mg /Kg)": "7"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida - Hormiguicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera ",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (planta verde)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Romero",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACETAMIPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETATO DE AMONIO",
            "Aptitud": "(Feromona)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ACETOCLOR",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "ACIDO ARSANILICO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Naranja (Jugo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACIDO ARSANILICO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Naranja (Pulpa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ACIDO BETA NAFTOXIACETICO",
            "Aptitud": "(Fitorregulador)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO BORICO",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO CACODILICO",
            "Aptitud": "(Defoliante - Desecante)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ACIDO CACODILICO",
            "Aptitud": "(Defoliante - Desecante)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ACIDO CACODILICO",
            "Aptitud": "(Defoliante - Desecante)",
            "Cultivos": "Algodón (pellets)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ACIDO CITRICO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO FOSFORICO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cebada cervecera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Lúpulo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GIBERELICO/ GIBERELINA A3",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "ACIDO GRASO METACLORO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO INDOL 3 BUTÍRICO",
            "Aptitud": "(Fitorregulador)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO ORTOFOSFORICO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIDO PROPIONICO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ACIRFLUORFEN SODICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ACIRFLUORFEN SODICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "ACLONIFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "ACLONIFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ACRINATRINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ACROLEINA",
            "Aptitud": "(Alguicida - Herbicida) ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ALACLOR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALCOHOL ALCOXILADO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ALCOHOL ETOXILADO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ALCOHOLES GRASOS",
            "Aptitud": "(Fitorregulador)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ALCOHOLES GRASOS",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ALFA NAFTALEN ACETATO DE SODIO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFA NAFTALEN ACETATO DE SODIO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lino (Grano)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ALFACIPERMETRINA/ALFAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ALQUIL FENOL ETOXILADO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AMETOCTRADIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AMETOCTRADIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "AMETOCTRADIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "AMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "AMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AMICARBAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar ",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "AMICARBAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "AMICARBAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AMINA GRASA ETOXILADA",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AMINOETOXIVINILGLICINA",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AMINOPYRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas de gramíneas",
            "Residuos (mg /Kg)": "60"
        },
        {
            "Principio activo": "AMINOPYRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "AMINOTRIAZOL",
            "Aptitud": "(Herbicida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AMISULBRON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AMITRAZ",
            "Aptitud": " (Acaricida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AMITRAZ",
            "Aptitud": " (Acaricida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AMONIO CUATERNARIO",
            "Aptitud": "(Alguicida - Bactericida - Fungicida) ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ASULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ATRAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZADIRACTINA",
            "Aptitud": " (Fitorregulador - Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz blanco (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Colza",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Romero",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "AZOXISTROBINA",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "AZUFRE",
            "Aptitud": "(Fungicida - Acaricida)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS SUBTILIS",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS SUBTILIS",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS SUBTILIS",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS SUBTILIS",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida - Acaricida)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Algodón ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Caña de azúcar",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Forestales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Mijo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Lino",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Sorgo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BACILLUS THURINGIENSIS",
            "Aptitud": "(Insecticida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BEAUVERIA BASSIANA",
            "Aptitud": "(Acaricida)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BENALAXIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BENALAXIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENALAXIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENALAXIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENAZOLIN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENAZOLIN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENAZOLIN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENFURACARB ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENFURACARB ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa (papa semilla)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (bulbo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz (grano sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Puerro",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera ",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera ",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "2.5"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz (forraje seco)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (forraje seco)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BENOMIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Bulbos, estacas destinadas a plantacion",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espárrago (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (forraje)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (forraje)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENTAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno ",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz Dulce",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate ",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "BENZOATO DE EMAMECTINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.006"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.006"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BENZOVINDIFLUPIR",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.09"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.09"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz Dulce",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.08"
        },
        {
            "Principio activo": "BETACIFLUTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (forraje seco)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "BETACIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BICICLOPIRONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BIFENAZATE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BIFENAZATE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BIFENAZATE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.025"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BIFENTRIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BISPIRIBAC  SODICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)              ",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BISTRIFLURÓN ",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BIXAFEN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BIXAFEN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.08"
        },
        {
            "Principio activo": "BIXAFEN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.9"
        },
        {
            "Principio activo": "BIXAFEN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa ",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1.7"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "     Uva (de mesa y vinificación)             ",
            "Residuos (mg /Kg)": "3.5"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1.2"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "1.2"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BOSCALID",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "BRODIFACOUM",
            "Aptitud": "(Rodenticida)",
            "Cultivos": "Cuevas",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BROMACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Areas no cultivadas",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BROMADIOLONE",
            "Aptitud": "(Rodenticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Cítricos en general (jugo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOPROPILATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (forraje seco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje seco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "BROMOXINIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arboles",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Tratamiento de suelos",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Arándano *",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Cereales (productos de molienda)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Granos de cereales almacenados",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Chirimoya",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Kiwi",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Membrillo *",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Palta",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Pepino Dulce *",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Pimiento *",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Tuna *",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "BROMURO DE METILO",
            "Aptitud": "(Insecticida - Fungicida - Herbicida - Rodenticida - Gorgojicida - Nematicida)",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPIRIMATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Rosales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "BUPROFEZIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "BUTAFENACIL",
            "Aptitud": "(Herbicida Desecante)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BUTAFENACIL",
            "Aptitud": "(Herbicida Desecante)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BUTRALIN",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BUTRALIN",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "BUTRALIN",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CAOLIN ",
            "Aptitud": "(Antiescaldante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CAOLINITA",
            "Aptitud": "(Antiescaldante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tabaco",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "CAPTAN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (forraje verde/seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (forraje verde/seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (forraje verde/seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Henos de cereales",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje verde/seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (forraje)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (forraje verde/seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (forraje verde/seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBARIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cultivos forestales ",
            "Residuos (mg /Kg)": "exento"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Ananá",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Ananá",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Banana (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Cebolla (bulbo seco)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Espárrago (para propagación)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Frambuesa",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general ",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general ",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Cítricos en general (sin cáscara)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Grosella",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Lúpulo (seco)",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Palta",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "14"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Remolacha",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Tabaco",
            "Residuos (mg /Kg)": "exento"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Zarzamora",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "exento"
        },
        {
            "Principio activo": "CARBENDAZIM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CARBOFURAN",
            "Aptitud": "(Insecticida - Nematicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARBOFURAN",
            "Aptitud": "(Insecticida - Nematicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CARBONATO BASICO DE CU",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CARBOXIN",
            "Aptitud": "(Tratamiento de semillas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CARBOXIN",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Cebadilla criolla ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CARFENTRAZONE ETIL",
            "Aptitud": "(Herbicida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CARFENTRAZONE ETIL",
            "Aptitud": "(Herbicida - Defoliante - Desecante)",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARFENTRAZONE ETIL",
            "Aptitud": "(Herbicida - Defoliante - Desecante)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "CARFENTRAZONE ETIL",
            "Aptitud": "(Herbicida - Defoliante - Desecante)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CARTAP",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CIALOFOP BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CIANAMIDA HIDROGENADA",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "Exento "
        },
        {
            "Principio activo": "CIPERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Ciruela (pasa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Trigo (heno)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CIPERMETRINA  ",
            "Aptitud": " (Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLETODIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLODINAFOP  PROPARGIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLODINAFOP  PROPARGIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOFENTEZINE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLOFENTEZINE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLOFENTEZINE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLOFENTEZINE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLOFENTEZINE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLOFENTEZINE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOMAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas de gramineas naturales e implantadas",
            "Residuos (mg /Kg)": "30"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOPIRALID",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOQUINTOCET MEXYL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOQUINTOCET MEXYL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORANSULAM  METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANSULAM  METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Arveja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Poroto",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLORANTRANILIPROLE",
            "Aptitud": "(Insecticida - Acaricida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLORFENAPIR",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORFENAPIR",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORFENAPIR",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORFLUAZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORFLUAZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORFLUAZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORFLUAZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORIDAZON / PIRAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORIDAZON / PIRAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORIDAZON / PIRAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORIMURON  ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORIMURON  ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORIMURON  ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Uva (pasa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLOROMECUATO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Florales (Azalea/Crisantemo/Estrella fed/ Rosa china/Arbolito japonés)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOROPICRINA",
            "Aptitud": "(Herbicida - Fungicida - Nematicida)",
            "Cultivos": "Tratamiento de suelos",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Banana (pulpa)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa (lavada)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLOROTALONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales ( Crisantemo, gladiolo, clavel, rosal)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina blanca de trigo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "4"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida - Hormiguicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida - Hormiquicida)",
            "Cultivos": "Banana (pulpa)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "Exento Pre S!"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Frutilla ",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lino (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "4"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CLORPIRIFOS ETIL/CLORPIRIFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CLORPROFAM / C.I.P.C",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Papa (lavada)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "CLORSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLORSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Agropyron sp.",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Colza (forraje)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Dactylis glomerata",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Festuca arundinácea",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Lolium multiflorum",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Phalaris canariensis",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CLOTHIANIDIN",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CUMETETRALIL",
            "Aptitud": "(Rodenticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.8"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.8"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CYANTRANILIPROLE (CYAZYPYR)",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallo (Calabaza)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CYAZOFAMID",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa ",
            "Residuos (mg /Kg)": "0.14"
        },
        {
            "Principio activo": "CYAZOFAMID",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "CYCLANILIDE",
            "Aptitud": "(Fitorregulador - Defoliante)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYFLUTRIN / CYFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYHEXATIN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CYHEXATIN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CYHEXATIN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CYFLUMETOFEN",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CYMOXANIL",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYMOXANIL",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maní (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "CYPROCONAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Florales y Ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "CYPRODINIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "CYPRODINIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "CYPRODINIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "CYPRODINIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CYPRODINIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (vinificación)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "CYPROSULFAMIDE",
            "Aptitud": "(Antidoto de Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (forraje)                    ",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tréboles (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DALAPON  / ACIDO 2,2 DICLOROPROPIONICO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)             ",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "DAMINOZINE",
            "Aptitud": "(Fitorregulador)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DAZOMET",
            "Aptitud": "(Fungicida - Herbicida -  Nematicida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (seca)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granos almacenados en general",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina blanca de trigo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina integral de trigo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (chaucha)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano seco)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DELTAMETRINA / DECAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Forestales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIALURIN ESTER + POLIET. GLICOL ESTER",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Mijo (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano, forraje, heno)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DICAMBA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas de gramíneas",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DICLOFO  METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano seco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DICLOFOP  METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DICLOFOP  METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DICLOFOP  METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje seco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DICLORPROP  / 2,4 DP",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DICLORPROP  / 2,4 DP",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DICLOSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DICLOSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DICLOSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DIFENILAMINA",
            "Aptitud": "(Antiescaldante)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "DIFENILAMINA",
            "Aptitud": "(Antiescaldante)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Cebadilla criolla ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Colza",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa (pelada)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "1.1"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.45"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.9"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIFENOCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.001"
        },
        {
            "Principio activo": "DIFETIALONE",
            "Aptitud": "(Rodenticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "DIFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFLUFENICAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIFLUFENICAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIFLUFENICAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIMETENAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DIMETIL DISULFURO",
            "Aptitud": "(Insecticida - Nematicida - Fungicida)",
            "Cultivos": " ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIMETIPHIN",
            "Aptitud": "(Defoliante)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Aceituna (elaborada)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Aceituna (aceite refinado)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Achicoria ",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Colinabo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Puerro",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Yerba Mate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIMETOATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETOMORF",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa                            ",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIMETOMORF",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIMETSULFURON  / NICOSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETSULFURON  / NICOSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMETSULFURON  / NICOSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (silaje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIMOXISTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DINICONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DINOTEFURAN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DINOTEFURAN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DINOTEFURAN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DINOTEFURAN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "DINOTEFURAN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Cebada (grano consumo) ",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Colza (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Lino (torta)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Salvado de trigo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Trébol rojo (forraje)",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Trébol blanco (forraje)",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIQUAT DIBROMURO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Harina blanca de trigo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DITIANON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DITIANON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "DITIANON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DITIANON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DITIANON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "DIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa) ",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "DODECADIENOL",
            "Aptitud": "(Feromona)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DODECENILACETATO",
            "Aptitud": "(Feromona)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "DODECIL BENCENO SULF TRIETANOLAMIDA",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (aceite)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "EPOXICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ESFENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ESTER METILICO DE ACEITES VEGETALES",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ESTER POLIGLICOL DE ACIDOS GRASOS",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Café",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cítricos en general (excepto limón)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cítricos en general (excepto limón)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ETEFON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Tomate                                ",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ETHABOXAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ETHIPROLE",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Soja (grano consumo) ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ETION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ETION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cítricos en general (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ETION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ETION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ETION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "EXTRACTO DE AJO",
            "Aptitud": "(Repelente)",
            "Cultivos": "Ciruela, Olivo, Cebolla",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FAMOXADONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " (Nematicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENAMIFOS",
            "Aptitud": " Nematicida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FENARIMOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENARIMOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENARIMOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENARIMOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENARIMOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENARIMOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Rosales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FENAZAQUIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FENAZAQUIN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENAZAQUIN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FENAZAQUIN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENAZAQUIN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FENBUCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENBUCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENBUCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENBUCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FENBUTATIN OXIDO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENHEXAMID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FENHEXAMID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FENHEXAMID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvado de arroz",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENITROTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENMEDIFAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENOXAPROP ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FENPIROXIMATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENPIROXIMATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENPIROXIMATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FENPIROXIMATO",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENPROPATRINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENPROPATRINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENPROPATRINA",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FENTOATO",
            "Aptitud": "(Acaricida - Insecticida - Tucuricida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (heno)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (seca)",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harinas blanca de trigo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina integral de trigo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FENVALERATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alamo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FERBAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FERBAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FERBAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FERBAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FERBAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FERBAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.005"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FIPRONIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLAZASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLAZASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLAZASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLAZASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLONICAMID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FLONICAMID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FLONICAMID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FLORPYRAUXIFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco) ",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZIFOP- P- BUTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUAZINAM",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUAZINAM",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUAZINAM",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUAZINAM",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FLUAZINAM",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "coliflor",
            "Residuos (mg /Kg)": "0.8"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.6"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FLUBENDIAMIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallo ( calabaza)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUCARBAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida - Tratamiento de Semillas)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida - Tratamiento de Semillas)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida - Tratamiento de Semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida - Tratamiento de Semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": " Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "0.6"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Sorgo (grano consumo) ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUDIOXONIL",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUFENACET",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUFENOXURON",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUFENOXURON",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUMETRALIN",
            "Aptitud": "(Desbrotador - Fitorregulador)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUMETSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUMETSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUMETSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUMETSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUMETSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUMICLORAC PENTIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pelón",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (vaina fresca)",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUMIOXAZIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUOMETURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOMETURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "4"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.06"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUOPICOLIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOROCLORIDONA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUOXASTROBIN",
            "Aptitud": "(Fungicida - Tratamiento de Semillas)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUOXASTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUOXASTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUOXASTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUOXASTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUOXASTROBIN",
            "Aptitud": "(Fungicida - Tratamiento de Semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUQUINCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUQUINCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas de gramíneas",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUROXIPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUSILAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUSILAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUSILAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo) ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUSILAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUSILAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FLUTRIAFOL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Fungicida Tratamiento de semillas)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FLUXAPYROXAD",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FLUXOFENIM",
            "Aptitud": "(Antídoto de herbicida - Tratamiento de semillas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOLCISTEINA",
            "Aptitud": "(Fitorregulador)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (vinificación)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FOLPET",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOMESAFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOMESAFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOMESAFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FORAMSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cítricos en general (pulpa)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Romero",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "FORMETANATO",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Florales y ornamentales, céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "FOSETIL ALUMINIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Avellano",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Cebolla",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Espárrago",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Especias",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Flores de corte",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Frutas secas en general",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Granos almacenados en general",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Granos de cacao",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Harina de cereales y leguminosas",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Hortalizas desecadas",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Pelones",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSFINA",
            "Aptitud": "(Acaricida - Gorgojicida - Insecticida - Rodenticida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "FOSMET",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "FOSTIAZATE",
            "Aptitud": "(Nematicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.005"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Harina de trigo",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Nuez (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida - trat de suelos) ",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "GAMACIALOTRINA / LAMBDACIALOTRINA",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GIBERELINAS A4 A7",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Crisantemo, Cyclamen y Clavel",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GLANDLURE",
            "Aptitud": "(Feromona)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "500"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco) ",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Forraje (seco)             ",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Palta",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano no maduro)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)                 ",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Yerba Mate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GLIFOSATO / GLIFOSATO ACIDO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "4.5"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "GLUFOSINATO DE AMONIO",
            "Aptitud": "(Desecante - Herbicida)",
            "Cultivos": "Frutales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "GUAZATINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general ",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "GUAZATINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general (sin cáscara)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "HALOSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "HALOSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "HALOSULFURON METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "HALOXYFOP-P- METIL  ESTER",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "HEPTAMETILTRISILOXANO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "HEXACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "HEXACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "HEXACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "HEXAZINONA",
            "Aptitud": " (Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "HEXITIAZOX",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "4"
        },
        {
            "Principio activo": "HIDRAZIDA MALEICA",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "Ajo (consumo)  ",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "HIDRAZIDA MALEICA",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "Cebolla (consumo)                                                     ",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "HIDRAZIDA MALEICA",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "HIDRAZIDA MALEICA",
            "Aptitud": "(Fitorregulador - Herbicida)",
            "Cultivos": "                  Tabaco               ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "HIDROXICLORURO DE TRIMETILAMINA",
            "Aptitud": "(Feromona)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "HIDROXIDO DE COBRE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "IMAZALIL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Banana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "IMAZALIL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general (pulpa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "IMAZALIL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "IMAZALIL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "IMAZALIL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "IMAZALIL",
            "Aptitud": "(Fungicida - Tratamiento de semillas )",
            "Cultivos": "Trigo - Avena",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMAZAMOX",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZAMOX",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZAMOX",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMAZAMOX",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.025"
        },
        {
            "Principio activo": "IMAZAPIC ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.025"
        },
        {
            "Principio activo": "IMAZAPIC ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMAZAPIC ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.005"
        },
        {
            "Principio activo": "IMAZAPIC ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMAZAPIR ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.025"
        },
        {
            "Principio activo": "IMAZAPIR ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (Jugo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZAPIR ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZAPIR ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZAPIR ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pino",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMAZAPIR ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "IMAZAQUIN ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZAQUIN ",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMAZETAPIR",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "4"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Algodón ",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida - Tratamiento de semillas) ",
            "Cultivos": "Festuca Arundinácea",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz Dulce",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Poroto",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida - Tratamiento de semillas) ",
            "Cultivos": "Trigo - Avena",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IMIDACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Eucalipto",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pino",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "INDAZIFLAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "INDOXACARB",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "INDOXACARB",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "INDOXACARB",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "INDOXACARB",
            "Aptitud": "(Insecticida) ",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "IODOSULFURON  METIL SODIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IODOSULFURON  METIL SODIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IODOSULFURON  METIL SODIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IODOSULFURON  METIL SODIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IODOSULFURON  METIL SODIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IODOSULFURON  METIL SODIO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "IOXINIL OCTANOATO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IOXINIL OCTANOATO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Puerro",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "IPOCONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPOCONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPOCONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPOCONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPOCONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Soja (grano consumo) ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPOCONAZOLE",
            "Aptitud": "(Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano seco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "     Uva (de mesa y vinificación)             ",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "IPRODIONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Gladiolo, Clavel, Crisantem, Rosa",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "IPROVALICARB",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "IPROVALICARB",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ISOPYRAZAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ISOPYRAZAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ISOPYRAZAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ISOPYRAZAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ISOPYRAZAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "ISOXAFLUTOLE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "ISOXAFLUTOLE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ISOXAFLUTOLE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Forestales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (hojas)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KASUGAMICINA",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "KINETINA",
            "Aptitud": "(Fitorregulador)"
        },
        {
            "Principio activo": "KRESOXIM  METIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arroz",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KRESOXIM  METIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KRESOXIM  METIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "KRESOXIM  METIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "KRESOXIM  METIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "KRESOXIM  METIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "LACTOFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.003"
        },
        {
            "Principio activo": "LACTOFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "LECITINA DE SOJA",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "LENACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LENACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LENACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LENACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Remolacha (hojas)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LENACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LIGNOSULFONATO DE CALCIO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espárrago (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Puerro",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LINURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Gladiolo  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz Dulce",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "LUFENURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (forraje seco)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Mijo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas de gramíneas",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.C.P.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "M.S.M.A.",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tabaco",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Rosales   ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Gladiolo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MANCOZEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MANDIPROPAMID  ",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "MEPIQUAT CLORURO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "MEPIQUAT CLORURO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MEPIQUAT CLORURO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "MEPTYL DINOCAP",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MEPTYL DINOCAP",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (vinificación)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Harina de centeno",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Harina blanca de trigo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Salvado de centeno",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Salvado de trigo",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "MERCAPTOTION / MALATION",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "MESOTRIONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METABENZTIAZURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METABENZTIAZURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METABENZTIAZURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METAFLUMIZONE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METALAXIL   ",
            "Aptitud": "(Tratamiento de semillas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Alfalfa (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tabaco",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALAXIL – M -ISOMERO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METALDEHIDO",
            "Aptitud": "(Mata babosas y caracoles)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METAM POTASIO",
            "Aptitud": "(Nematicida - Fungicida - Herbicida)",
            "Cultivos": "Tratam. De suelo - Presiembra",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METAM SODIO",
            "Aptitud": "(Nematicida - Fungicida - Herbicida)",
            "Cultivos": "Tratam. De suelo - Presiembra",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METAMITRON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METAMITRON",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METIDATION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general (sin cáscara)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano seco)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (forraje seco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Rosales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Campos de golf",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIL TIOFANATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Campos deportivos",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Kiwi",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METILCICLOPROPENO",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIOCARB / METMERCAPTURON",
            "Aptitud": "(Insecticida - Molusquicida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Rábano",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Calabaza",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOLACLORO / S- METOLACLORO",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": " Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lino (grano consumo)    ",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOMIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Crisantemos",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METOMINOSTROBIN",
            "Aptitud": "(Fungicida) ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOMINOSTROBIN",
            "Aptitud": "(Fungicida) ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METOMINOSTROBIN",
            "Aptitud": "(Fungicida) ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METOMINOSTROBIN",
            "Aptitud": "(Fungicida) ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "METOXIFENOCIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "     Uva (de mesa y vinificación)             ",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METRAFENONE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "METRAFENONE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "     Uva (de mesa y vinificación)             ",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espárrago (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METRIBUZIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "METSULFURON   METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METSULFURON   METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pinus taeda",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "METSULFURON   METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "METSULFURON   METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (heno)",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "METSULFURON   METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "METSULFURON   METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES DE ACIDOS GRASOS DE ACEITES VEGETALES",
            "Aptitud": "(Insecticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES DE ACIDOS GRASOS DE ACEITES VEGETALES",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES DE ALQUIL FENOL Y POLIETILENGLICOL",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Romero",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MEZCLA DE ESTERES Y JABONES PROVENIENTES DE ÁCIDOS GRASOS DE ACEITES VEGETALES TRANS-ESTERIFICADOS CON GLICERINA.CONTIENE SUCROGLICÉRIDOS.",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "MOLINATE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "MYCLOBUTANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Crisantemo, Clavel, Rosal y céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "NAFTENO DE ZINC",
            "Aptitud": "(Fungicida - Insecticida - Preservador de madera )",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "NAPROPAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "NAPROPAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "NAPROPAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "NAPROPAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espárrago (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "NAPTALAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Viveros",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "NONIL FENOL ETOXILADO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "NOVALURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "OCTIFENOL Y POLIETILENGLICOL",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OLEATO DE ETILO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OLEATO DE POTASIO",
            "Aptitud": "(Insecticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ORTOFENILFENATO  DE SODIO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ORYZALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OXADIAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "OXADIAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXADIAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Clavel",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OXADIAZON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "OXASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "OXASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "OXATHIAPIPROLIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Palta",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (hojas)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXICLORURO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (hojas)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO CUPROSO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "OXIDO DE COCOAMIDA PROPIL",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (bulbo seco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Yerba Mate ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Forestales ( Pinus y Eucaliptus)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OXIFLUORFEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Té  ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "OXITETRACICLINA",
            "Aptitud": "(Antibiótico)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OXITETRACICLINA CLORHIDRATO",
            "Aptitud": "(Antibiótico)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "OXITETRACICLINA CLORHIDRATO",
            "Aptitud": "(Antibiótico)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "OXITETRACICLINA CLORHIDRATO",
            "Aptitud": "(Antibiótico)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "P.C.N.B.",
            "Aptitud": "(Fungicida)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano sin cáscara)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida - Desecante)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trébol blanco (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trébol rojo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tung",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Yerba Mate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PARAQUAT  (Dicloruro)",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PENCONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENCYCURON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa (lavada)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PENDIMETALIN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PENOXULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz con y sin cáscara",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PENTIOPIRAD",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "PENTIOPIRAD",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "PENTIOPIRAD",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje seco)",
            "Residuos (mg /Kg)": "100"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (seca)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Germen de trigo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granos de cereales almacenados",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina blanca de trigo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina integral de trigo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvado de trigo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PERMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alpiste (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pastura de gramíneas",
            "Residuos (mg /Kg)": "150"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PICLORAN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PICOXYSTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PINOXADEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PINOXADEN",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRAFLUFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PIRAFLUFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PIRAFLUFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PIRETRINAS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PIRETRINAS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIDAFENTION",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Forestales   ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "50"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general (excepto naranja)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "7"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "7"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Crisantemo y Rosal",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PIRIMICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "4"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida - Acaricida - Gorgojicida - Hormiguicida)",
            "Cultivos": "Arroz (grano pulido)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida - Acaricida - Gorgojicida - Hormiguicida)",
            "Cultivos": "Arroz (grano sin cáscara)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida - Acaricida - Gorgojicida - Hormiguicida)",
            "Cultivos": "Arroz C/cascara (grano almacenado)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "cebada (grano almacenado)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida - Acaricida - Gorgojicida - Hormiguicida)",
            "Cultivos": "Granos de cereales almacenados",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina blanca de Trigo",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina integral de Trigo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Harina de Centeno",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvado de Arroz",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvado de trigo",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "sorgo (grano almacenado)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PIRIMIFOS  METIL",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PIROXASULFONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada ",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PIROXASULFONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PIROXASULFONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PIROXASULFONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "POLIOXI ESTER AMINO GRASO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "POLISULFURO DE CALCIO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "POLYPHASE",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PRIMISULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PRIMISULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PRIMISULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (silaje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Romero",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (vinificación)",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "PROCIMIDONE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROCLORAZ",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROCLORAZ",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PROCLORAZ",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROCLORAZ",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROCLORAZ",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja (grano consumo) ",
            "Residuos (mg /Kg)": "0.006"
        },
        {
            "Principio activo": "PROCLORAZ",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ajo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Praderas (naturales)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROFENOFOS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROFOXIDIM /CLEFOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROFOXIDIM /CLEFOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (forraje seco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Comino (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Hinojo",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Menta",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROMETRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "7"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "20"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.8"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.8"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Girasol, soja, maní y maìz",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROPAMOCARB  CLORHIDRATO",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "12"
        },
        {
            "Principio activo": "PROPANIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPANIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (forraje seco)",
            "Residuos (mg /Kg)": "75"
        },
        {
            "Principio activo": "PROPANIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (salvado)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (con cáscara)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPAQUIZAFOP",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.6"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROPARGITE",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "6"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (con cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PROPICONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Lúpulo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PROPINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ornamentales ( Clavel, gladiolo, rosal)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROPIZAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PROPIZAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PROPIZAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PROPIZAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROPIZAMIDA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PROSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.002"
        },
        {
            "Principio activo": "PROSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PROSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PROSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PROSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Pasturas de gramíneas (Festuca arundinácea, Dactylis glomerata, Lolium multiflorum, Phalaris canariensis, Avena sp., Agropyron sp.)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PROTHIOCONAZOLE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebada",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.55"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo",
            "Residuos (mg /Kg)": "0.07"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "PYDIFLUMETOFEN",
            "Aptitud": "(Fungicida)",
            "Cultivos": " Uva (vinificación)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYMETROZINE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "PYMETROZINE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PYMETROZINE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebada",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Garbanzo (grano consumo)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (vinificación)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maíz (aceite)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRACLOSTROBIN",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PYRIMETANIL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Rúcula",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PYRIPROXYFEN",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PYRlDABEN",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRlDABEN",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "PYRlDABEN",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "PYRlDABEN",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "PYRlDABEN",
            "Aptitud": "(Acaricida - Insecticida)",
            "Cultivos": "Crisantemo/ Clavel / Rosal",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "PYROXSULAM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "QUINCLORAC",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "QUINCLORAC",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (forraje seco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "QUINOXYFEN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "QUINOXYFEN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa y vinificación)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "QUITOSANO",
            "Aptitud": "(Fitorregulador - Fungicida - Tratamiento de semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "QUITOSANO",
            "Aptitud": "(Fitorregulador - Fungicida - Tratamiento de semillas)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "QUIZALOFOP - ETIL /ACIPROFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP - ETIL /ACIPROFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP - ETIL /ACIPROFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "QUIZALOFOP - ETIL /ACIPROFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP - ETIL /ACIPROFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "QUIZALOFOP - ETIL /ACIPROFEN ETIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "QUIZALOFOP- P- TEFURIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "RIANODINA",
            "Aptitud": "(Insecticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "RIMSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho de maíz",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "RIMSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "RIMSULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "Herbicida",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Cebada",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "Herbicida",
            "Cultivos": "Eucalipto",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Desecante)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "Herbicida",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "0.7"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Desecante)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Desecante)",
            "Cultivos": "Soja ",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAFLUFENACIL",
            "Aptitud": "(Herbicida para Barbecho químico y entre surco)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SALES CCA",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SAPONINAS",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SEDAXANE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Cebada",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SEDAXANE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SEDAXANE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Cebada",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SERRICORNIN",
            "Aptitud": "(Feromona)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espárrago (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Frambuesa",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lino (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Menta ",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SETHOXIDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zarzamora",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SIMAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SIMAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SIMAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SIMAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SIMAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SIMAZINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Té",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (Aceite)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINETORAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "     Uva (de mesa y vinificación)             ",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Albahaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "0.25"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Berro",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cilantro",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno ",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Eneldo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela ",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general ",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Higo",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana ",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera ",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Orégano",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radicheta",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Romero",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Salvia",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate ",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomillo",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SPINOSAD",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPIRODICLOFEN",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SPIROMESIFEN",
            "Aptitud": "(Acaricida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.9"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.8"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Uva (de Mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "SPIROTETRAMAT",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Uva (Vinificación)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO CUPRICO PENTAHIDRATADO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFATO DE AMONIO",
            "Aptitud": "(Coadyuvante)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFATO DE ESTREPTOMICINA",
            "Aptitud": "(Antibiótico)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFATO DE GENTAMICINA",
            "Aptitud": "(Antibiótico)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SULFATO DE GENTAMICINA",
            "Aptitud": "(Antibiótico)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "SULFATO NEUTRO DE OXIQUINOL",
            "Aptitud": "(Desinfección de suelo -  Presiembra - Postsiembra)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TETRACUPICO TRICALCICO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Haba",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFATO TRIBÁSICO DE COBRE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.025"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFENTRAZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFLURAMIDA",
            "Aptitud": "(Hormiguicida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFOMETURÓN METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Barbecho químico y preS! de Soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (Aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (Grano consumo)",
            "Residuos (mg /Kg)": "0.08"
        },
        {
            "Principio activo": "SULFOXAFLOR",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (Heno)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "8"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Cebada (grano consumo) ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Festuca Arundinácea",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Granada",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "7"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Pasturas de gramíneas (Festuca arundinácea, Dactylis glomerata, Lolium multiflorum, Phalaris canariensis, Avena sp., Agropyron sp.)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Crisantemo/ Rosal/ Clavel y oranmentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEBUCONAZOLE /  FENETRAZOLE",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUFENOZIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUFENOZIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUFENOZIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (torta)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEBUFENOZIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUFENOZIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUFENOZIDE",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEBUTIURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TEFLUBENZURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TEFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEFLUTRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TEFLUTRINA",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEFLUTRINA",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TEMBOTRIONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TERBACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TERBACIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno y cítricos en vivero",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TERBUTILAZINA",
            "Aptitud": "(Herbicida pre-emergente)",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TERBUTILAZINA",
            "Aptitud": "(Herbicida pre-emergente)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TERBUTILAZINA",
            "Aptitud": "(Herbicida pre-emergente)",
            "Cultivos": "Maíz (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TERBUTILAZINA",
            "Aptitud": "(Herbicida pre-emergente)",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "UP"
        },
        {
            "Principio activo": "TERBUTRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TERBUTRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TERBUTRINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TETRACONAZOLE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Tréboles (forraje)",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1.5"
        },
        {
            "Principio activo": "TETRADIFON",
            "Aptitud": "(Acaricida)  ",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "THIENCARBAZONE METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "THIENCARBAZONE METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "THIENCARBAZONE METIL",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Banana (con cáscara)",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Banana (sin cáscara)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Membrillo",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ornamentales, Gladiolos, tulipanes, iris y narcisos",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIABENDAZOL",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida) ",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "TIACLOPRID",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TIADIAZURON",
            "Aptitud": "(Defoliante)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Alfafla ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Avena ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.03"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "UP"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Aceituna (fresca)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Perejil",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Soja ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Maiz, girasol, algodón, avena, trigo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Pasturas consociadas (leguminosas y gramíneas)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIAMETOXAM",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TIERRA DE DIATOMEAS",
            "Aptitud": "(Insecticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIERRA DE DIATOMEAS",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Granos almacenados",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIFENSULFURON METIL",
            "Aptitud": "(Insecticida)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIODICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.4"
        },
        {
            "Principio activo": "TIODICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIODICARB",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TIODICARB",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Trigo, cebada",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIODICARB",
            "Aptitud": "(Insecticida - Tratamiento de semillas)",
            "Cultivos": "Algodón, maiz",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Arroz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Batata",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Cardo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Cebadilla criolla",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Col",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Espinaca",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Especies Forrajeras",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Girasol",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Gladiolo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Jacinto",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Maíz dulce (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Mostaza",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Nabo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Narciso",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Sorgo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TIRAM",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TOLCLOROS METIL",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TOLPYRALATE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TOLYFLUANID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TOLYFLUANID",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TOLYFLUANID",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Cultivos": "Algodón, poroto, maní y soja",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TOPRAMEZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maíz (grano y aceite)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TOPRAMEZONE",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRALKOXYDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (forraje seco)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRALKOXYDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRALKOXYDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje seco)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRALKOXYDIM",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (forraje)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Centeno (forraje)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Centeno (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Céspedes",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "15"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIADIMEFON",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Crisantemo, clavel, rosal y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIADIMENOL",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIADIMENOL",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIADIMENOL",
            "Aptitud": "(Funguicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIADIMENOL",
            "Aptitud": "(Funguicida - Tratamiento de semillas)",
            "Cultivos": "Trigo, cebada, avena, cebadilla criolla, fetuca y algodón",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.002"
        },
        {
            "Principio activo": "TRIASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIASULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Trigo (forraje seco)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIBROMO FENATO DE SODIO",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIBROMO FENOL",
            "Aptitud": "(Preservador de madera)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIBUFOS",
            "Aptitud": "(Defoliante)",
            "Cultivos": "Algodón",
            "Residuos (mg /Kg)": "0.08"
        },
        {
            "Principio activo": "TRICHODERMA",
            "Aptitud": "(Fungicida)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRICLOPYR",
            "Aptitud": "(Herbicida)  ",
            "Cultivos": "Pastura de gramíneas",
            "Residuos (mg /Kg)": "150"
        },
        {
            "Principio activo": "TRIFENIL ACETATO DE ESTAÑO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFENIL ACETATO DE ESTAÑO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFENIL ACETATO DE ESTAÑO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFENIL ACETATO DE ESTAÑO",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "7"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Alcaucil",
            "Residuos (mg /Kg)": "0.15"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "9"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Arándano",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Avena (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.04"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Limón",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maíz dulce",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Mandarina",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.015"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Naranja",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Nectarín / Pelón",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Pomelo",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": " Pomelo (Aceite)",
            "Residuos (mg /Kg)": "10"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Puerro",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida - Tratamiento de semillas )",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallito de tronco",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRIFLOXISTROBIN",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Florales y ornamentales ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIFLOXISULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLOXISULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLOXISULFURON",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLUMURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFLUMURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLUMURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.003"
        },
        {
            "Principio activo": "TRIFLUMURON",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.02"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Achicoria",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ají",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Alfalfa (forraje)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Almendra",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Brócoli",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cártamo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Colza (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Escarola",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Endivia",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Lenteja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Maní (sin cáscara)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Nuez",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Radiccio",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Repollito de Bruselas",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "TRIFLURALINA",
            "Aptitud": "(Herbicida)",
            "Cultivos": "Florales y ornamentales ( Gladiolos y arbustos)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRIFORINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFORINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFORINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRIFORINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFORINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "TRIFORINE",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Rosa, crisantemo y clavel",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "TRINEXAPAC ETIL",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Caña de azúcar (tallo fresco)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRINEXAPAC ETIL",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cebada (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRINEXAPAC ETIL",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Cebada (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRINEXAPAC ETIL",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Raygrass (prod. De semillas)",
            "Residuos (mg /Kg)": "0.01"
        },
        {
            "Principio activo": "TRINEXAPAC ETIL",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Trigo (forraje)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRINEXAPAC ETIL",
            "Aptitud": "(Fitorregulador)",
            "Cultivos": "Trigo (grano consumo)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "TRITICONAZOLE",
            "Aptitud": "(Fungicida - Tratamiento de semillas)  ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "VALIPHENAL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Cebolla",
            "Residuos (mg /Kg)": "0.3"
        },
        {
            "Principio activo": "VALIPHENAL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.05"
        },
        {
            "Principio activo": "VALIPHENAL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "VALIPHENAL",
            "Aptitud": "(Fungicida)  ",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "1.17"
        },
        {
            "Principio activo": "VIRUS DE LA GRANULOSIS DE CYDIA",
            "Aptitud": "(Biológico)",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Algodón (semilla consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Maíz (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Girasol (Grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (aceite)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZETAMETRINA",
            "Aptitud": "(Insecticida)",
            "Cultivos": "Soja (grano consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Acelga",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Berenjena",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Chaucha",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Coliflor",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Espárrago (consumo)",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Frutilla",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Garbanzo (Grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Guinda",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Lechuga",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Nabo",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pepino",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Remolacha (raíz)",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Repollo",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZINEB",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Florales y ornamentales",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ajo (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Apio",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Arveja (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ornamentales   ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZOXAMIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cebolla (consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cereza",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ciruela",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Damasco",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Durazno",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Cítricos en general",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Manzana",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Melón",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pera",
            "Residuos (mg /Kg)": "2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Pimiento",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Poroto (grano consumo)",
            "Residuos (mg /Kg)": "0.5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Sandía",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tabaco ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Tomate",
            "Residuos (mg /Kg)": "3"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Uva (de mesa)",
            "Residuos (mg /Kg)": "5"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zanahoria",
            "Residuos (mg /Kg)": "0.2"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Zapallo",
            "Residuos (mg /Kg)": "1"
        },
        {
            "Principio activo": "ZIRAM",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Ornamentales   ",
            "Residuos (mg /Kg)": "Exento"
        },
        {
            "Principio activo": "ZOXAMIDE",
            "Aptitud": "(Fungicida)",
            "Cultivos": "Papa",
            "Residuos (mg /Kg)": "0.1"
        }
    ] '
readStream)
   for: #Collection
      customDo: [ :mapping | mapping listOfType: OrderedCollection ];
	nextAs: #Collection.
	whiteListItems := json
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
	activeIngredients do: [ :each | actIng := ActiveIngredient ingredient: each. actIng save ]
	
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> loadCultivars [
	| cultivar |
	cultivars do: [ :each | cultivar := Crop name: each yield: 0. cultivar save ]
	
]

{ #category : #'as yet unclassified' }
FOMActiveIngredientLoader >> loadWhiteListToCultivars [
	|cultiv|
	cultiv:= Crop selectAll.
	cultiv do: [ :each | self makeWhiteListOf: each with: (self whiteListItemsOf: each) ]
	
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
