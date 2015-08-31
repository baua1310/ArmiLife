if (!isBusy) then {
	isBusy = true;
	_a = [];
	switch (handItem) do {
		case "Empty Hands": {
			_mapObjects = [["water","sacks_goods","b_ficusc1s","b_ficusc2d","bricks","garbage","atm_","phone"],2] call getMapObjects;
			if(count _mapObjects > 0 && isNull cursorTarget) then {
				switch (_mapObjects select 0) do {
					case "sacks_goods": { [3,"Gathering goods...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer; _a = [["AL_apple",1],["AL_orange",1],["AL_potatoes",1]]; titleText ["You gathered different fruits","PLAIN"]; };
					case "water": { [5,"Gathering water...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer; _num = floor random 4; _a = [["AL_water",_num]]; titleText [format ["You gathered %1 units of water",_num],"PLAIN"]; };
					case "b_ficusc1s": { [5,"Gathering wood...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer; _a = [["AL_wood",_num]]; titleText ["You gathered 1 units of wood","PLAIN"];};
					case "bricks": { [5,"Gathering stone bricks...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer; [1,15,3] call fnc_addInventoryItem; titleText ["You gathered 3 units of stone bricks","PLAIN"]; };
					case "garbage": { [5,"Searching in the garbage...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer; titleText ["You gathered a terrible smell.","PLAIN"]; };
					case "atm_": { titleText ["You have no credit card","PLAIN"]; };
					case "phone": { titleText ["This phone requires your credit card","PLAIN"]; };
				};
			} else {
				_mapObjects = [["t_oleae1s"],6] call getMapObjects;
				if(count _mapObjects > 0 && isNull cursorTarget) then {
					switch (_mapObjects select 0) do {
						case "t_oleae1s": { _num = floor random 4; [5,"Gathering apples...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer; _a = [["AL_apple",_num]]; };
					};
				};
			};
		};
		case "Pickaxe": {};
		case "Credit Card": {
			_mapObjects = [["atm_","phone"],2] call getMapObjects;
			if(count _mapObjects > 0 && isNull cursorTarget) then {
				switch (_mapObjects select 0) do {
					case "atm_": { titleText ["Welcome to your bank account","PLAIN"]; };
					case "phone": { titleText ["Please enter the telephone number","PLAIN"]; };
				};
			};
		};
	};

	{
		for [{_i=1},{_i<=(_x select 1)},{_i=_i+1}] do {
			player addItem (_x select 0);
		};
	} forEach _a;
	
	isBusy = false;
};