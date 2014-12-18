if (!isBusy) then {
  isBusy = true;
  switch (handItem) do {
    case "Empty Hands": {
      _mapObjects = [["water","sacks_goods","b_ficusc1s","bricks","garbage","atm_","phone"],2] call getMapObjects;
      if(count _mapObjects > 0) then {
        switch (_mapObjects select 0) do {
          case "sacks_goods": { titleText ["Gathering goods...","PLAIN"]; sleep 3; [0,12,1] call fnc_addInventoryItem; [0,17,1] call fnc_addInventoryItem; [0,18,1] call fnc_addInventoryItem; titleText ["You gathered different fruits","PLAIN"]; };
          case "water": { titleText ["Gathering water...","PLAIN"]; sleep 5; _num = floor random 4; [0,2,_num] call fnc_addInventoryItem; titleText [format ["You gathered %1 units of water",_num],"PLAIN"]; };
          case "b_ficusc1s": { titleText ["Gathering wood...","PLAIN"]; sleep 5; [0,1,1] call fnc_addInventoryItem; titleText ["You gathered 1 units of wood","PLAIN"];};
          case "bricks": { titleText ["Gathering stone bricks...","PLAIN"]; sleep 5; [1,15,3] call fnc_addInventoryItem; titleText ["You gathered 3 units of stone bricks","PLAIN"]; };
          case "garbage": { titleText ["Searching in the garbage...","PLAIN"]; sleep 5; titleText ["You gathered a terrible smell.","PLAIN"]; };
          case "atm_": { titleText ["You have no credit card","PLAIN"]; };
          case "phone": { titleText ["This phone requires your credit card","PLAIN"]; };
        };
      } else {
        _mapObjects = [["t_oleae1s"],6] call getMapObjects;
        if(count _mapObjects > 0) then {
          switch (_mapObjects select 0) do {
            case "t_oleae1s": { titleText ["Gathering apples...","PLAIN"]; sleep 5; _num = floor random 4; [0,12,_num] call fnc_addInventoryItem; titleText [format ["You gathered %1 apples",_num],"PLAIN"]; };
          };
        };
      };
    };
    case "Pickaxe": {};
    case "Credit Card": {
      _mapObjects = [["atm_","phone"],2] call getMapObjects;
      if(count _mapObjects > 0) then {
        switch (_mapObjects select 0) do {
          case "atm_": { titleText ["Welcome to your bank account","PLAIN"]; };
          case "phone": { titleText ["Please enter the telephone number","PLAIN"]; };
        };
      };
    };
  };
  isBusy = false;
};