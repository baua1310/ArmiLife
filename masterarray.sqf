capAreas = [
	["capKavala",1,100],["capPyrgos",2,100],
	["capAthanos",1,100],["capPanochori",1,100],
	["capZaros",1,100],["capNothing2",1,100],
	["capNothing",1,100],["capGori",1,100],
	["capOreokastro",1,100],["capAtsalis",1,100],
	["capPyrsos",1,100],["capNera",1,100],
	["capAgrios",1,100],["capDionysios",1,100],
	["capKoroni",1,100],["capAthira",1,100],
	["capPoliakko",1,100],["capMarky",1,100],
	["capNeochori",1,100],["capBorder",3,100],
	["capNothing3",1,100],["capAirport",1,100],
	["capNychi",1,100],["capZeloran",1,100],
	["capVikos",3,100],["capPyrgi",3,100],
	["capAAC",3,100],["capAnthrakia",2,100],
	["capPetros",2,100],["capPefkas",2,100],
	["capNidasos",2,100],["capAndreas",2,100],
	["capMolos",2,100],["capSofia",2,100],
	["capDelfinaki",2,100],["capGatolia",2,100],
	["capAlmyra",2,100],["capLimni",2,100],
	["capCharkia",2,100],["capDorida",2,100],
	["capSofia",2,100],["capWindmills",2,100],
	["capChalkeia",2,100],["capSurf",2,100],
	["capLivadi",2,100],["capFaronaki",2,100],
	["capEkali",2,100],["capWindmills2",2,100],
	["capFeres",2,100],["capTrachia",2,100],
	["capBowls",2,100]
];

/*
	ONLY ARMITXES DEVS MAY MODIFY - SERVER DEVS MAY ADD A OWN ARRAY FOR THEIR ITEMS.
	IF YOU REALLY NEED A NEW ITEM ADDED HERE, REQUEST/SUGGEST IT IN THE ARMITXES FORUMS.

	ALWAYS ADD NEW ITEMS TO THE END!
	NEVER REMOVE OR REPLACE AN EXISTING ITEM
	ELSE IT'LL CAUSE DB PROBLEMS. ABUSE WILL LEAD TO
	SERVER-IP BLACKLIST.
*/
itemList = [
	["Iron","AL_Iron",8,["object"],[0,0] ],
	["Wood","AL_Wood",3,["object"],[0,0] ],
	["Clean Water","AL_Water",1,["object"],[0,0] ],
	["Gold","AL_Gold",300,["object"],[0,0] ],
	["Silver","AL_Silver",100,["object"],[0,0] ],
	["Copper","AL_Copper",50,["object"],[0,0] ],
	["Wheat","AL_Wheat",3,["object"],[0,0] ],
	["Oil","AL_Oil",60,["object"],[0,0] ],
	["Fish","AL_Fish",4,["object"],[0,0] ],
	["Stone","AL_Stone",1,["object"],[0,0] ],
	["Metal","AL_Metal",6,["object"],[0,0] ], // 10
	["Diamond","AL_Diamond",800,["object"],[0,0] ],
	["Apple","AL_Apple",1,["object"],[0,0] ],
	["Generator","AL_Generator",2500,["object"],[0,0] ],
	["Bauxite","AL_Bauxite",30,["object"],[0,0] ],
	["Wool","AL_Wool",20,["object"],[0,0] ],
	["Dirt","AL_Dirt",0,["object"],[0,0] ],
	["Orange","AL_Orange",1,["object"],[0,0] ],
	["Potatoes","AL_Potatoes",2,["object"],[0,0] ],
	["Natural Rubber","AL_NRubber",3,["object"],[0,0] ],
	["Turtle","AL_Turtle",200,["object"],[0,0] ], // 20
	["Snake","AL_Snake",2,["object"],[0,0] ],
	["Rabbit","AL_Rabbit",2,["object"],[0,0] ],
	["Shark","AL_Shark",400,["object"],[0,0] ],
	["Plastic","AL_Plastic",120,["object"],[0,0] ],
	["Nitric Acid","AL_NAcid",40,["object"],[0,0] ],
	["Wood Plank","",6,["object"],[0,0] ],
	["Stick","",1,["object"],[0,0] ],
	["Axe","",100,["object"],[0,0] ],
	["Pickaxe","",100,["object"],[0,0] ],
	["Aluminium","",10,["object"],[0,0] ], // 30
	["String","",1,["object"],[0,0] ],
	["Fishing Hook","",2,["object"],[0,0]],
	["Fishing Rod","",15,["object"],[5,5]],
	["Sand","",1,["object"],[4000,4000]],
	["Glass","",2,["object"],[0,0]],
	["Shovel","",8,["object"],[3,3]],
	["Diamond Ring","",1200,["object"],[0,0]],
	["Cable","",5,["object"],[0,0]],
	["Copper Plate","",10,["object"],[0,0]],
	["Fiber Optic Cable","",45,["object"],[0,0]], // 40
	["Stone Bricks","",2,["object"],[0,0] ],
	["Credit Card","",0,["object"],[0,0] ],
	["Tires","",60,["object"],[50,50] ],
	["Bandage","Land_Bandage_F",2,["object"],[200,200] ],
	["Defibrillator","Land_Defibrillator_F",200,["object"],[10,10] ],
	["Blood Bag","Land_BloodBag_F",20,["object"],[200,200] ],
	["Heat Pack","Land_HeatPack_F",3,["object"],[1000,1000] ],
	["Vitamin Bottle","Land_VitaminBottle_F",2,["object"],[1000,1000] ],
	["Baked Beans","Land_BakedBeans_F",2,["object"],[100,100]],
	["Water Bottle","Land_BottlePlastic_V2_F",1,["object"],[10000,10000] ], // 50
	["Water Canteen","Land_Canteen_F",10,["object"],[20,20]],
	["Cereals Box","Land_CerealsBox_F",4,["object"],[20,20]],
	["Powdered Milk","Land_PowderedMilk_F",2,["object"],[20,20]],
	["Rice Box","Land_RiceBox_F",2,["object"],[20,20]],
	["C4","",30000,["object"],[0,0]],
	["Quadbike","C_Quadbike_01_F",1500,["vehicle","land"],[0,0]],
	["Hatchback","C_Hatchback_01_F",10000,["vehicle","land"],[0,0]],
	["SUV","C_SUV_01_F",30000,["vehicle","land"],[0,0]],
	["Pickup Offroad","C_Offroad_01_F",40000,["vehicle","land"],[0,0]],
	["Hatchback Sport","C_Hatchback_01_sport_F",15000,["vehicle","land"],[0,0]], // 60
	["Lada White","RDS_Lada_Civ_01",2000,["vehicle","land"],[0,0]],
	["Lada Red","RDS_Lada_Civ_02",2000,["vehicle","land"],[0,0]],
	["Rusty Lada","RDS_Lada_Civ_03",2000,["vehicle","land"],[0,0]],
	["Lada Hippie","RDS_Lada_Civ_04",2000,["vehicle","land"],[0,0]],
	["Police Lada","RDS_Lada_Civ_05",2000,["vehicle","land"],[0,0]],
	["VW Golf","RDS_Golf4_Civ_01",4000,["vehicle","land"],[0,0]],
	["Blue Bus","RDS_Ikarus_Civ_01",10000,["vehicle","land"],[0,0]],
	["Red Bus","RDS_Ikarus_Civ_02",10000,["vehicle","land"],[0,0]],
	["Skoda Octavia","RDS_Octavia_Civ_01",18000,["vehicle","land"],[0,0]],
	["Limousine (Hatchback)","RDS_Hatchback_01_F",18000,["vehicle","land"],[0,0]], // 70
	["SUV RDS","RDS_SUV_01_F",30000,["vehicle","land"],[0,0]],
	["GAZ Blue","RDS_Gaz24_Civ_01",5000,["vehicle","land"],[0,0]],
	["GAZ Silver","RDS_Gaz24_Civ_02",5000,["vehicle","land"],[0,0]],
	["GAZ Black","RDS_Gaz24_Civ_03",5000,["vehicle","land"],[0,0]],
	["Van (Open)","RDS_Van_01_transport_F",24000,["vehicle","land"],[0,0]],
	["Van (Refuel)","RDS_Van_01_fuel_F",20000,["vehicle","land"],[0,0]],
	["Van (Container)","RDS_Van_01_box_F",24000,["vehicle","land"],[0,0]],
	["MH-9 Hummingbird","B_Heli_Light_01_F",135000,["vehicle","air"],[0,0]],
	["Fireplace","FirePlace_burning_F",0,["object"],[0,0]]
];

licenseArray = [
	["Drivers License",2020],
	["Truck License",4020],
	["Pilot License",50000],
	["Non-Lethal License",50],
	["Pistol License",3000],
	["Rifle License",10000]
];


/* SHOP ARRAYS */
shopCar = [56,61,62,63,64,66,72,73,74,57,60,69,70,71,58,59,75,77];
shopBus = [67,68];
shopRefuel = [76];