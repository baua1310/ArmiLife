_al = PLAYERDATA select 11;

if (_al > 2) then {
	switch (_this) do {
		case "open": {
			if (_al > 2) then {
				if (!(createDialog "lbPlayers")) exitWith {hint "Dialog Error!";};
				disableSerialization;
				_dsp = findDisplay 100;
				{
					if (isPlayer _x) then {
						_entry = lbAdd [2024,name _x];
						lbSetData [_dsp,_entry,_x];
					};
				} forEach playerarray;
			};
		};
		case "exe": {
			_code = ctrlText 2200;
			hintSilent _code;
		};
		case "tp": { allowTP = true; openMap true; };
	};
};