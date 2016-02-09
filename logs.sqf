/* Usage: ["show","crimes"] execVM logs.sqf; */
_exe = _this select 0;
_log = _this select 1;
_params = _this select 2;

switch (_exe) do {
	case "wipe": {
		tempNotifyLog = [];
		logFinances = [];
		logPolice = [];
		logAdmin = [];
		logCrimes = [];
	};
	case "add": {
		if (typeName _log == "STRING" && typeName _params == "STRING") then {
			_doNotify = true;
			
			switch (_log) do {
				case "admin": { logAdmin = logAdmin + [_params]; };
				case "police": { logPolice = logPolice + [_params]; _doNotify=false; };
				case "finances": { logFinances = logFinances + [_params]; _doNotify=false; };
				case "crimes": {
					logCrimes = logCrimes + [_params];
					if (PLAYERDATA select 7 != 2) then {_doNotify=false;};
				};
			};
				
			if (_doNotify) then {
				tempNotifyLog = tempNotifyLog + [_params + "<br /><br />--------------<br /><br />"];
				tempNotifyLog resize 3;

				_txt = "";
				{
					_txt = _txt+_x;
				} forEach tempNotifyLog;

				hintSilent parseText _txt;
			};
		};
	};
	case "show": {
		_logArray = []
		switch (_log) do {
			case "admin": { _logArray = logAdmin; };
			case "police": { _logArray = logPolice; };
			case "finances": { _logArray = logFinances; };
			case "crimes": { _logArray = logCrimes; };
		};
		
		if (!(createDialog "logList")) exitWith {hint "Dialog Error!";};
		disableSerialization;

		{ lbAdd [1,_x]; } forEach _logArray;
	};
};