Class {
	#name : #ExampleDataLoaderToShowcaseTheDashboard,
	#superclass : #Object,
	#instVars : [
		'session',
		'lastDay'
	],
	#category : #'ProyectoHuertas-example-data'
}

{ #category : #constants }
ExampleDataLoaderToShowcaseTheDashboard >> activeIngredients [
	^ ( '6 bencil adenina.Acefato.Aceite de arbol del te.Aceite de creosota.Aceite de soja.Aceite escencial de ajo.Acequinocyl.Acetamiprid.Acetato de amonio.Acetoclor.Acido arsanilico.Acido beta naftoxiacetico.Acido borico.Acido cacodilico.Acido citrico.Acido fosforico.Acido graso metacloro.Acido indol 3 butírico.Acido ortofosforico.Acido propionico.Acirfluorfen sodico.Aclonifen.Acrinatrina.Acroleina.Alaclor.Alcohol alcoxilado.Alcohol etoxilado.Alcoholes grasos.Alfa naftalen acetato de sodio.Alquil fenol etoxilado.Ametoctradin.Ametrina.Amicarbazone.Amina grasa etoxilada.Aminoetoxivinilglicina.Aminopyralid.Aminotriazol.Amisulbron.Amitraz.Amonio cuaternario.Asulam.Atrazina.Azadiractina.Azoxistrobina.Azufre.Bacillus subtilis.Bacillus thuringiensis.Beauveria bassiana.Benalaxil.Benazolin etil.Benfuracarb.Benomil.Bentazon.Benzoato de emamectina.Benzovindiflupir.Betaciflutrin.Betacipermetrina.Biciclopirona.Bifenazate.Bifentrin.Bispiribac  sodico.Bistriflurón.Bixafen.Boscalid.Brodifacoum.Bromacil.Bromadiolone.Bromopropilato.Bromoxinil.Bromuro de metilo.Bupirimato.Buprofezin.Butafenacil.Butralin.Caolin.Caolinita.Captan.Carbaril.Carbendazim.Carbofuran.Carbonato basico de cu.Carboxin.Carfentrazone etil.Cartap.Cialofop butil.Cianamida hidrogenada.Cipermetrina.Cletodim.Clodinafop  propargil.Clofentezine.Clomazone.Clopiralid.Cloquintocet mexyl.Cloransulam  metil.Clorantraniliprole.Clorfenapir.Clorfluazuron.Clorimuron  etil.Cloromecuato.Cloropicrina.Clorotalonil.Clorpirifos  metil.Clorsulfuron.Clothianidin.Contiene sucroglicéridos.Cumetetralil.Cyantraniliprole (cyazypyr).Cyazofamid.Cyclanilide.Cyflumetofen.Cyhexatin.Cymoxanil.Cyproconazole.Cyprodinil.Cyprosulfamide.Daminozine.Dazomet.Dialurin ester + poliet.Dicamba.Diclofo  metil.Diclofop  metil.Diclosulam.Difenilamina.Difenoconazole.Difetialone.Diflubenzuron.Diflufenican.Dimetenamida.Dimetil disulfuro.Dimetiphin.Dimetoato.Dimetomorf.Dimoxistrobin.Diniconazole.Dinotefuran.Diquat dibromuro.Ditianon.Diuron.Dodecadienol.Dodecenilacetato.Dodecil benceno sulf trietanolamida.Epoxiconazole.Esfenvalerato.Ester metilico de aceites vegetales.Ester poliglicol de acidos grasos.Etefon.Ethaboxam.Ethiprole.Etion.Extracto de ajo.Famoxadone.Fenamifos.Fenarimol.Fenazaquin.Fenbuconazole.Fenbutatin oxido.Fenhexamid.Fenitrotion.Fenmedifan.Fenoxaprop etil.Fenpiroximato.Fenpropatrina.Fention.Fentoato.Fenvalerato.Ferbam.Fipronil.Flazasulfuron.Flonicamid.Florpyrauxifen etil.Fluazifop- p- butil.Fluazinam.Flubendiamide.Flucarbazone.Fludioxonil.Flufenacet.Flufenoxuron.Flumetralin.Flumetsulam.Flumiclorac pentil.Flumioxazim.Fluometuron.Fluopicolide.Fluorocloridona.Fluoxastrobin.Fluquinconazole.Fluroxipir.Flusilazole.Flutriafol.Fluxapyroxad.Fluxofenim.Folcisteina.Folpet.Fomesafen.Foramsulfuron.Formetanato.Fosetil aluminio.Fosfina.Fosmet.Fostiazate.Giberelinas a4 a7.Glandlure.Glicol ester.Glufosinato de amonio.Guazatine.Halosulfuron.Halosulfuron metil.Haloxyfop-p- metil  ester.Heptametiltrisiloxano.Hexaconazole.Hexazinona.Hexitiazox.Hidrazida maleica.Hidroxicloruro de trimetilamina.Hidroxido de cobre.Imazalil.Imazamox.Imazapic.Imazapir.Imazaquin.Imazetapir.Imidacloprid.Indaziflam.Indoxacarb.Iodosulfuron  metil sodio.Ioxinil octanoato.Ipoconazole.Iprodione.Iprovalicarb.Isopyrazam.Isoxaflutole.Kasugamicina.Kinetina.Kresoxim  metil.Lactofen.Lecitina de soja.Lenacil.Lignosulfonato de calcio.Linuron.Lufenuron.Mancozeb.Mandipropamid.Mepiquat cloruro.Meptyl dinocap.Mesotrione.Metabenztiazuron.Metaflumizone.Metalaxil.Metalaxil – m -isomero.Metaldehido.Metam potasio.Metam sodio.Metamitron.Metconazole.Metidation.Metil tiofanato.Metilciclopropeno.Metiram.Metomil.Metominostrobin.Metoxifenocide.Metrafenone.Metribuzin.Metsulfuron   metil.Mezcla de esteres de acidos grasos de aceites vegetales.Mezcla de esteres de alquil fenol y polietilenglicol.Mezcla de esteres y jabones provenientes de ácidos grasos de aceites vegetales trans-esterificados con glicerina.Molinate.Myclobutanil.Nafteno de zinc.Napropamida.Naptalan.Nonil fenol etoxilado.Novaluron.Octifenol y polietilenglicol.Oleato de etilo.Oleato de potasio.Ortofenilfenato  de sodio.Oryzalin.Oxadiazon.Oxasulfuron.Oxathiapiprolin.Oxicloruro de cobre.Oxido cuproso.Oxido de cocoamida propil.Oxifluorfen.Oxitetraciclina.Oxitetraciclina clorhidrato.Paraquat  (dicloruro).Penconazole.Pencycuron.Pendimetalin.Penoxulam.Pentiopirad.Permetrina.Picloran.Picoxystrobin.Pinoxaden.Piraflufen etil.Piretrinas.Piridafention.Pirimicarb.Pirimifos  metil.Piroxasulfone.Polioxi ester amino graso.Polisulfuro de calcio.Polyphase.Primisulfuron.Procimidone.Procloraz.Profenofos.Prometrina.Propamocarb  clorhidrato.Propanil.Propaquizafop.Propargite.Propiconazole.Propineb.Propizamida.Prosulfuron.Prothioconazole.Pydiflumetofen.Pymetrozine.Pyraclostrobin.Pyrimetanil.Pyriproxyfen.Pyrldaben.Pyroxsulam.Quinclorac.Quinoxyfen.Quitosano.Quizalofop- p- tefuril.Rianodina.Rimsulfuron.Saflufenacil.Sales cca.Saponinas.Sedaxane.Serricornin.Sethoxidim.Simazina.Spinetoram.Spinosad.Spirodiclofen.Spiromesifen.Spirotetramat.Sulfato cuprico pentahidratado.Sulfato de amonio.Sulfato de estreptomicina.Sulfato de gentamicina.Sulfato neutro de oxiquinol.Sulfato tetracupico tricalcico.Sulfato tribásico de cobre.Sulfentrazone.Sulfluramida.Sulfometurón metil.Sulfoxaflor.Tebufenozide.Tebutiuron.Teflubenzuron.Teflutrina.Tembotrione.Terbacil.Terbutilazina.Terbutrina.Tetraconazole.Tetradifon.Thiencarbazone metil.Tiabendazol.Tiacloprid.Tiadiazuron.Tiametoxam.Tierra de diatomeas.Tifensulfuron metil.Tiodicarb.Tiram.Tolcloros metil.Tolpyralate.Tolyfluanid.Topramezone.Tralkoxydim.Triadimefon.Triadimenol.Triasulfuron.Tribromo fenato de sodio.Tribromo fenol.Tribufos.Trichoderma.Triclopyr.Trifenil acetato de estaño.Trifloxistrobin.Trifloxisulfuron.Triflumuron.Trifluralina.Triforine.Trinexapac etil.Triticonazole.Valiphenal.Virus de la granulosis de cydia.Zetametrina.Zineb.Ziram.Zoxamide'
		splitOn: '.')
		collect: [ :tradeName | 
			ActiveIngredient new
				tradeName: tradeName ;
				yourself ]
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addDemoEvents [
	lastDay := Date today.
	self addEventTomatoInwaitingPeriodTo: (self session farm plots at: 1). 
	self addEventAcelgaToHarvestTo: (self session farm plots at: 2).
	self addEventTomatoInwaitingPeriodTo: (self session farm plots at: 3). 
	self addEventAcelgaToHarvestTo: (self session farm plots at: 4).
	self addEventEspinacaInwaitingPeriodTo: (self session farm plots at: 5).	
	self addEventPimientoInHarvestingTo: (self session farm plots at: 7).
	self addEventPimientoInHarvestingTo: (self session farm plots at: 8).
	self addEventAlbahacaInHarvestingTo: (self session farm plots at: 9)
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addDemoPlots [
	^ self plots
		do: [ :plot | 
			plot save.
			session farm addPlot: plot.
			session farm save ]
]

{ #category : #constants }
ExampleDataLoaderToShowcaseTheDashboard >> addDemoSubstances [
	| ingredients crops |
	ingredients:= session gapAFarm activeIngredients.
	crops:= session gapAFarm crops.
	self 
		addSubstance: (ingredients at: 1) to: (crops at: 9) with: 10;
		addSubstance: (ingredients at: 10) to: (crops at: 1) with: 3;
		addSubstance: (ingredients at: 5) to: (crops at: 4) with: 8;
		addSubstance: (ingredients at: 7) to: (crops at: 5) with: 21.		
]

{ #category : #adding }
ExampleDataLoaderToShowcaseTheDashboard >> addDemoUsers [
	5
		timesRepeat: [ | user farm |
			lastDay := Date today.
			user := GAFUser new.
			farm := Farm name: 'nueva granja'.
			self plots
				do: [ :each | 
					farm addPlot: each.
					each save ].
			self addProblemsTo: farm plots.
			farm problems do: [ :each | each save ].
			user addFarm: farm.
			farm save.
			user save ]
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addEventAcelgaToHarvestTo: aPlot [
	| crop sowing harvesting |
	crop := session gapAFarm crops
		detect: [ :each | each vulgarName = 'Acelga' ].
	sowing := Sowing
		date: (lastDay subtractDays: 29)
		time: '12:00' asTime
		plot: aPlot
		crop: crop
		quantity: (Measurement magnitude: 1000 unit: 'Plantas')
		timeToHarvest: 30
		harvestDuration: 4
		expectedYield: 2000.
	harvesting := Harvesting
		date: (lastDay subtractDays: 1)
		time: '18:00' asTime
		plot: aPlot
		crop: crop
		quantity: 1000.
	aPlot
		addEvent: sowing;
		addEvent: harvesting.
	sowing save.
	harvesting save.
	aPlot save
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addEventAlbahacaInHarvestingTo: aPlot [
	| crop sowing harvesting |
	crop := session gapAFarm crops
		detect: [ :each | each vulgarName = 'Albahaca' ].
	sowing := Sowing
		date: (lastDay subtractDays: 40)
		time: '12:00' asTime
		plot: aPlot
		crop: crop
		quantity: (Measurement magnitude: 1000 unit: 'Plantas')
		timeToHarvest: 38
		harvestDuration: 10
		expectedYield: 2000.
	harvesting := Harvesting
		date: (lastDay subtractDays: 1)
		time: '18:00' asTime
		plot: aPlot
		crop: crop
		quantity: 1000.
	aPlot
		addEvent: sowing;
		addEvent: harvesting.
	sowing save.
	harvesting save.
	aPlot save
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addEventEspinacaInwaitingPeriodTo: aPlot [
	| crop substance sowing problem application |
	crop := session gapAFarm crops
		detect: [ :each | each vulgarName = 'Espinaca' ].
	substance := session gapAFarm substances at: 3.
	sowing := Sowing
		date: (lastDay subtractDays: 30)
		time: '18:00' asTime
		plot: aPlot
		crop: crop
		quantity: (Measurement magnitude: 1000 unit: 'Plantas')
		timeToHarvest: 40
		harvestDuration: 7
		expectedYield: 2000.
	problem := Problem
		date: (lastDay subtractDays: 15)
		time: '18:00' asTime
		plot: aPlot
		name: 'Alternaria'
		type: Problem types second.
	application := Application
		date: (lastDay subtractDays: 10)
		time: '18:00' asTime
		plot: aPlot
		substance: substance
		dose: '2'
		machine: '1'
		reason: Application reasons second.
	aPlot
		addEvent: sowing;
		addEvent: application;
		addEvent: problem.
	sowing save.
	problem save.
	application save.
	aPlot save
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addEventPimientoInHarvestingTo: aPlot [
	| crop sowing harvesting |
	crop := session gapAFarm crops
		detect: [ :each | each vulgarName = 'Pimiento' ].
	sowing := Sowing
		date: (lastDay subtractDays: 25)
		time: '12:00' asTime
		plot: aPlot
		crop: crop
		quantity: (Measurement magnitude: 1000 unit: 'Plantas')
		timeToHarvest: 22
		harvestDuration: 10
		expectedYield: 2000.
	harvesting := Harvesting
		date: (lastDay subtractDays: 2)
		time: '18:00' asTime
		plot: aPlot
		crop: crop
		quantity: 1000.
	aPlot
		addEvent: sowing;
		addEvent: harvesting.
	sowing save.
	harvesting save.
	aPlot save
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addEventTomatoInwaitingPeriodTo: aPlot [
	| crop substance sowing problem application |
	crop := session gapAFarm crops
		detect: [ :each | each vulgarName = 'Tomate' ].
	substance := session gapAFarm substances at: 1.
	sowing := Sowing
		date: (lastDay subtractDays: 45)
		time: '18:00' asTime
		plot: aPlot
		crop: crop
		quantity: (Measurement magnitude: 1000 unit: 'Plantas')
		timeToHarvest: 50
		harvestDuration: 7
		expectedYield: 2000.
	problem := Problem
		date: (lastDay subtractDays: 5)
		time: '18:00' asTime
		plot: aPlot
		name: 'Pulgón'
		type: Problem types first.
	application := Application
		date: (lastDay subtractDays: 2)
		time: '18:00' asTime
		plot: aPlot
		substance: substance
		dose: '2'
		machine: '1'
		reason: Application reasons first.
	aPlot
		addEvent: sowing;
		addEvent: application;
		addEvent: problem.
	sowing save.
	problem save.
	application save.
	aPlot save
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addExpertDemoData [
	session gapAFarm crops ifEmpty: [ self crops do: #save ].
	session gapAFarm activeIngredients
		ifEmpty: [ self activeIngredients do: #save ].
	session gapAFarm substances ifEmpty: [ self addDemoSubstances ].
	self addDemoUsers
]

{ #category : #loading }
ExampleDataLoaderToShowcaseTheDashboard >> addFarmerDemoData [
	session gapAFarm crops ifEmpty: [ self addExpertDemoData ].
	session farm plots
		ifEmpty: [ self addDemoPlots].
	self addDemoEvents
]

{ #category : #adding }
ExampleDataLoaderToShowcaseTheDashboard >> addProblemsTo: plots [
	(plots at: 1)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 5)
				time: '18:00' asTime
				plot: (plots at: 1)
				name: 'Pulgón'
				type: Problem types first).
	(plots at: 2)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 5)
				time: '18:00' asTime
				plot: (plots at: 2)
				name: 'Mosca blanca'
				type: Problem types fourth).
	(plots at: 3)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 10)
				time: '18:00' asTime
				plot: (plots at: 3)
				name: 'Pulgón'
				type: Problem types first).
	(plots at: 4)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 10)
				time: '18:00' asTime
				plot: (plots at: 4)
				name: 'Mosca blanca'
				type: Problem types fourth).
	(plots at: 5)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 5)
				time: '18:00' asTime
				plot: (plots at: 5)
				name: 'Alternaria'
				type: Problem types second).
	(plots at: 7)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 5)
				time: '18:00' asTime
				plot: (plots at: 7)
				name: 'Alternaria'
				type: Problem types second).
	(plots at: 8)
		addEvent:
			(Problem
				date: (lastDay subtractDays: 5)
				time: '18:00' asTime
				plot: (plots at: 8)
				name: 'Alternaria'
				type: Problem types second)
]

{ #category : #constants }
ExampleDataLoaderToShowcaseTheDashboard >> addSubstance: ingredient to: crop with: days [
	| substance |
	substance := Substance new
		comercialName: 'Preparado de ' , ingredient tradeName;
		addActiveIngredient: ingredient.
	substance addWithdrawalPeriodRecommendation:
		(WithdrawalPeriodRecommendation
		daysToWait: days
		crop: crop
		referenceUrl: '') .
	substance save.
	^substance 
]

{ #category : #constants }
ExampleDataLoaderToShowcaseTheDashboard >> crops [
	^ {'Acelga' . 'Ají' . 'Albahaca' . 'Berenjena' . 'Espinaca' . 'Lechuga'.
	'Pimiento' . 'Rúcula' . 'Tomate'}
		collect: [ :vulgarName | 
			Crop new
				vulgarName: vulgarName;
				yourself ]
]

{ #category : #constants }
ExampleDataLoaderToShowcaseTheDashboard >> plots [
	^ (1 to: 10)
		collect: [ :each | Plot id: 'A' , each asString surface: 1000 ]
]

{ #category : #accessing }
ExampleDataLoaderToShowcaseTheDashboard >> session [
	^ session
]

{ #category : #accessing }
ExampleDataLoaderToShowcaseTheDashboard >> session: anObject [
	session := anObject
]
