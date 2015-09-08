_action = _this select 0;

switch (_action) do {
	case "gear_use": {
		_selId= (_this select 1) select 1;
		_items = call fnc_getGearItems;
		_item = _items select _selId;
		_itemClass = _item select 0;
		_itemAmount = _item select 1;
		
		if (!(createDialog "YesNo")) exitWith {hint "Dialog Error!";};
		disableSerialization;
		_display = findDisplay 1000;
		_capData = (capAreas select capWar);
		(_display displayCtrl 1) ctrlSetText format ["Do you really want to use 1 item of %1?",_itemClass];
		antwort = 2;
		waitUntil { isNull(findDisplay 1000); };
		
		if(antwort == 1) then {
			_r = true;
			if(!isNull("_itemClass")) then {
				switch (_itemClass) do {
					case "AL_apple": { [5] call fnc_setNutrition; };
					case "AL_orange": { [5] call fnc_setNutrition; };
					default { _r = false; systemChat "I don't know what to do with this..."; };
				};
			};
			
			if(_r) then {
				_box = _this select 2;
				if(_box < 3) then { player removeItem _itemClass; };
			};
			systemChat format ["You used 1 %1",_itemClass];
		};
	};
};