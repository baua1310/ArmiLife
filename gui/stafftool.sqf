_rank = PLAYERDATA select 11;

_dlgOpen = false;

disableSerialization;
if (_rank > 49) then {
	switch (_this) do {
		case "open": {
			if (_rank > 199) then {
				// Developer [Trainee = 200, Full = 201, Head = 202], Owner = 255;
			};
			
			if (_rank > 149) then {
				// Admin [Trainee = 150, Full = 151, Head = 152];
			};
				
			if (_rank > 99) then {
				// Moderator [Trainee = 100, Full = 101, Head = 102];
			};
			// Support [Trainee = 50, Full = 51, Head = 52]
			if(!_dlgOpen) then { if (!(createDialog "supportTool")) exitWith {hint "Dialog Error!";};};
			_dsp = findDisplay 100;
			_ctrl = _dsp displayCtrl 2024;

			_entry = lbAdd [2024,"All Players"];
			_ctrl lbSetData [_entry,"true"];
			{
				if (isPlayer _x) then {
					_entry = lbAdd [2024,name _x];
					_ctrl lbSetData [_entry,str _x];
				};
			} forEach playerarray;
		};
		case "warn": {
			_dsp = findDisplay 100;
			_ctrl = _dsp displayCtrl 2024;
			_sel = lbCurSel 2024;
			_txt = (ctrlText 1400);
			_tar = _ctrl lbData _sel;
			
			if (count _txt > 10) then {
				_txt = "<t color='#FF0000'>~ Staff Message ~</t><br />" + _txt;
				if (_sel == -1 || _sel == 0) then { _tar = true; } else { _tar = call compile _tar; };
				[ [["add","admin",_txt],"logs.sqf"] ,"BIS_fnc_execVM",_tar,false ] call BIS_fnc_MP;
			} else { systemChat "Message too short"; };
		};
		case "teamspeak": {
			_dsp = findDisplay 100;
			_ctrl = _dsp displayCtrl 2024;
			_sel = lbCurSel 2024;_txt = ctrlText 1400;
			
			_tar = true;
			_txt = "<t color='#FF0000'>~ Staff Message ~</t><br />All Police, EMS and Government members MUST be on TeamSpeak! ~ Connect to bbts3.com";
			[ [["add","admin",_txt],"logs.sqf"] ,"BIS_fnc_execVM",_tar,false ] call BIS_fnc_MP;
		};
		case "exe": {
			_code = ctrlText 2200;
			hintSilent _code;
		};
		case "tp": { allowTP = true; openMap true; };
	};
};