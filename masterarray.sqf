capAreas = [
  ["capKavala",0,100],["capPyrgos",1,100],
  ["capAthanos",0,100],["capPanochori",0,100],
  ["capZaros",0,100],["capNothing2",0,100],
  ["capNothing",0,100],["capGori",0,100],
  ["capOreokastro",0,100],["capAtsalis",0,100],
  ["capPyrsos",0,100],["capNera",0,100],
  ["capAgrios",0,100],["capDionysios",0,100],
  ["capKoroni",0,100],["capAthira",0,100],
  ["capPoliakko",0,100],["capMarky",0,100],
  ["capNeochori",0,100],["capBorder",2,100],
  ["capNothing3",0,100],["capAirport",0,100],
  ["capNychi",0,100],["capZeloran",0,100],
  ["capVikos",2,100],["capPyrgi",2,100],
  ["capAAC",2,100],["capAnthrakia",1,100],
  ["capPetros",1,100],["capPefkas",1,100],
  ["capNidasos",1,100],["capAndreas",1,100],
  ["capMolos",1,100],["capSofia",1,100],
  ["capDelfinaki",1,100],["capGatolia",1,100],
  ["capAlmyra",1,100],["capLimni",1,100],
  ["capCharkia",1,100],["capDorida",1,100],
  ["capSofia",1,100],["capWindmills",1,100],
  ["capChalkeia",1,100],["capSurf",1,100],
  ["capLivadi",1,100],["capFaronaki",1,100],
  ["capEkali",1,100],["capWindmills2",1,100],
  ["capFeres",1,100],["capTrachia",1,100],
  ["capBowls",1,100]
];

// Items
productionResources = [
  "Iron","Wood","Clean Water","Gold","Silver","Copper","Wheat","Oil","Fish","Stone",
  "Metal","Diamond","Apple","Electricity","Bauxite","Wool","Dirt","Orange","Potatoes","Natural Rubber",
  "Turtle","Snake","Fish","Rabbit","Shark","Plastic"
];
productionComponents = [
  ["Wood Plank","",[ [[0,1,1] ],5],false ],
  ["Stick","",[ [[1,0,2] ],2],false ],
  ["Axe","",[ [[1,1,2],[0,0,3] ],1],true ],
  ["Pickaxe","",[[[1,1,2],[0,0,3]],1],true ],
  ["Aluminium","",[ [[0,14,2]],1],false ],
  ["String","",[ [[1,15,1]],5 ],false], //5
  ["Fishing Hook","",[ [[0,0,3]],1],false ],
  ["Fishing Rod","",[ [[1,1,2],[1,5,2],[1,6,1]],1],true ],
  ["Sand","",[ [[0,16,1]],1],false ],
  ["Glass","",[ [[1,8,1]],1,"Furnance" ],false ],
  ["Shovel","",[ [[1,1,2],[0,0,3] ],1],true ], //10
  ["Diamond Ring","",[ [[0,11,3], [0,4,9]] ,6],false],
  ["Cable","",[ [[1,13,1],[0,19,3]] ,4],false],
  ["Copper Plate","",[ [[0,5,1]] ,1],false],
  ["Fiber Optic Cable","",[ [[1,9,3],[0,19,3]], 2],false],
  ["Stone Bricks","",[ [[0,9,3]], 1], false], // 15
  ["Credit Card","",[ [[1,4,1]], 1], true],
  ["Tires","",[ [[0,19,10],[1,4,3]], 1],false],
  ["Bandage","Land_Bandage_F",[[],0,nil,5] ],
  ["Defibrillator","Land_Defibrillator_F",[[],0,nil,1000] ],
  ["Blood Bag","Land_BloodBag_F",[[],0],false ], // 20
  ["Heat Pack","Land_HeatPack_F",[[],0,nil,5],false ],
  ["Vitamin Bottle","Land_VitaminBottle_F",[[],0,nil,200],false,"player enableFatigue false;" ],
  ["Baked Beans","Land_BakedBeans_F",[[],0],false,"hunger = hunger - 60;" ],
  ["Water Bottle","Land_BottlePlastic_V2_F",[[],0],false,"durst = durst - 60;" ],
  ["Water Canteen","Land_Canteen_F",[[],0],false,"durst = durst - 80;" ], //25
  ["Cereals Box","Land_CerealsBox_F",[[],0],false,"hunger = hunger - 40;" ],
  ["Powdered Milk","Land_PowderedMilk_F",[[],0],false,"hunger = hunger - 15; durst = durst - 100;" ],
  ["Rice Box","Land_RiceBox_F",[[],0],false,"hunger = hunger - 60;" ]
];
vehiclesArray = [
  ["Quadbike","C_Quadbike_01_F",[ [[1,17,4],[1,12,3],[0,25,20]],1 ] ],
  ["Hatchback","C_Hatchback_01_F",[ [[1,17,4],[1,12,5],[1,4,25]],1 ] ],
  ["SUV","C_SUV_01_F",[ [[1,17,4],[1,12,6],[1,4,28]],1 ] ],
  ["Pickup Offroad","C_Offroad_01_F",[ [[1,17,4],[1,12,7],[1,4,30]],1 ] ],
  ["Hatchback Sport","C_Hatchback_01_sport_F",[ [[1,17,4],[1,12,9],[1,4,34]],1 ] ],
  ["MH-9 Hummingbird","B_Heli_Light_01_F",[ [[1,10,4]],1 ] ]   // 5
];
placeableObjects = [
  ["Fireplace","FirePlace_burning_F",[ [[0,9,5],[0,1,5]],1],false ]
];
// End Items
masterarray = [productionComponents, vehiclesArray, placeableObjects];

licenseArray = [
  ["Drivers License",2020],
  ["Truck License",4020],
  ["Pilot License",50000],
  ["Non-Lethal License",50],
  ["Pistol License",3000],
  ["Rifle License",10000]
];

/* type: 0->Prod,1=Veh,2=place */
if(!isDedicated) then {
  getALObject = {
    private ["_type","_id","_obj"];
    _type = -1;
    _id = -1;
    _obj = -1;
    
    for [{_tid=0},{_tid<(count masterarray)},{_tid=_tid+1}] do {
      _curId = 0;
      {
        _ident = (_x select 0);
        _found = false;
        switch (typeName _ident) do {
          case "STRING": { if(_ident == _this) then { _found = true; }; };
          case "ARRAY": { if(_this in _ident) then { _found = true; }; };
        };
        if(_found) exitWith { _id = _curId; _obj = _x; };
        _curId = _curId + 1;
      } forEach (masterarray select _tid);
      if(!(_id == -1)) exitWith { _type = _tid; };
    };
    
    [_type,_id,_obj]
  };
  
  getMapObjects = {
    private ["_check","_near","_haystack","_compare","_needle"];
    _check = _this select 0;
    _distance = _this select 1;
    _near = [];
    
    _haystack = [];
    { _haystack = _haystack + (toArray str(_x)); } forEach ((nearestObjects [player, [], _distance]) - [player]);
    
    {
      _needle = toArray _x;
      _needleLength = count _needle;
      
      for [{_i=0}, {_i<(count _haystack)}, {_i=_i+1}] do {
        if(
            (_haystack select _i) == (_needle select 0) &&
            (_haystack select (_i+1)) == (_needle select 1)
          ) then
        {
          _compare = [];
          for [{_l=0}, {_l<_needleLength}, {_l=_l+1}] do {
            _compare = _compare + [_haystack select (_i+_l)];
          };
          
          if(count (_compare-_needle) == 0) then { _near = _near + [_x]; };
        };
      };    
    } forEach _check;
    
    _near
  };
};