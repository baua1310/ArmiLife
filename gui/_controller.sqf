_action = _this select 0;

switch (_action) do {
	case "init": {
	private ["_hud","_target"];
		2 cutRsc ["mainOverlay","PLAIN"];

		disableSerialization;
		_hud = uiNameSpace getVariable ["mainOverlay",displayNull];    
		_money = (_hud displayCtrl 1001);
		_money ctrlSetText format["$%2 || Bank: $%1",PLAYERDATA select 1,PLAYERDATA select 2];

		_faction = (_hud displayCtrl 1000);
		if (PLAYERDATA select 11 > 250) then { onMapSingleClick "if (allowTP) then { allowTP = false; player setpos _pos; };"; };
		_faction ctrlSetText ((PLAYERDATA select 6) call fnc_nationIDtoName);

		_money ctrlCommit 0;
		_faction ctrlCommit 0;
		    
		0 call fnc_setHand;
	};
	case "inv": {
		if(!dialog) then { createDialog "playerSettings"; };
		disableSerialization;
		_display = findDisplay 2001;
		(_display displayCtrl 2015) ctrlSetText format [" Cash: $%2\n Bank: $%1",(PLAYERDATA select 1),(PLAYERDATA select 2)];

		_c = 0;
		{
			_amount = _x select 2;
			_itemarr = _x call fnc_getItemArray;
			if(_x select 0 == 0) then { _itemarr = [_itemarr]; };
			(_display displayCtrl 2005) lbAdd format["%1 (%2)",(_itemarr select 0),_amount];
			(_display displayCtrl 2005) lbSetData [_c,str([_x,_itemarr])];
			_c = _c + 1;
		} forEach (PLAYERDATA select 3);

		_lics = "";
		{
		  _lics = _lics + format["%1\n",(licenseArray select _x) select 0];
		} forEach (PLAYERDATA select 4);
		(_display displayCtrl 2014) ctrlSetText _lics;
	};
	case "idcard": {
		if(!dialog) then { createDialog "ArmiID"; };
		disableSerialization;
		_display = findDisplay 1601;
		(_display displayCtrl 1) ctrlSetText format ["Name: %1",PLAYERDATA select 13];
		(_display displayCtrl 4) ctrlSetText format ["Nation: %1",(PLAYERDATA select 6) call fnc_nationIDtoName];
		(_display displayCtrl 5) ctrlSetText format ["%1",getPlayerUID player];
	};
	case "profession": {
		if(!dialog) then { createDialog "professions"; };
		disableSerialization;
		_display = findDisplay 1602;
		_setDescr = {
			_display = findDisplay 1602;
			_listbox = (_display displayCtrl 1);
			_data = (call compile (_listbox lbData (_this select 1)));
			(_display displayCtrl 2) ctrlSetText (localize (_data select 1));
		};
		{
			_listbox = (_display displayCtrl 1);
			_entry = _listbox lbAdd (_x select 0);
			_listbox lbSetData [_entry,str(_x)];
			_listbox ctrlAddEventHandler ["LBSelChanged",_setDescr];
		} forEach profs;
	};
};