_do = _this select 0;

switch (_do) do {
	case "switch": {
		_vcl = vehicle player;
		_fID = PLAYERDATA select 7;
		if	(_vcl != player && _fID in [2,3]) then {
			_isOn = _vcl getVariable "siren"; if (isNil "_isOn") then { _isOn = false };
			
			if(!_isOn) then {
				_sName = "AL_Siren"; _sDur = 4.87;
				switch (_fID) do {
					case 3: { _sName = "AL_Siren_EMS"; _sDur = 4.87; };
				};
			
				[[["sync",_vcl,_sName,_sDur],"events\onSiren.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
				titleText ["Siren on", "PLAIN DOWN"];
			} else {
				_vcl setVariable ["siren",false,true];
				titleText ["Siren off", "PLAIN DOWN"];
			};
		};
	};
	case "sync": {
		_vcl = _this select 1;

		_vcl setVariable ["siren",true];
		[_vcl,_this select 2,_this select 3] spawn {
			_vcl = _this select 0; _sName = _this select 1; _sDur = _this select 2;
			while { _vcl getVariable "siren" } do {
				if (speed _vcl > 2) then { _vcl say [_sName,1,1]; sleep 4.87; };
			};
		};
	};
};