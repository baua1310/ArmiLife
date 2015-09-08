_action = _this select 0;
_caller = _this select 1;
_legit = true;

if (_action == "call_cop" || _action == "call_medic" || _action == "call_un") then {
  if(!prioCall) then {
    if((lastCall + 600) < time) then {
      if (!(createDialog "YesNo")) exitWith {hint "Dialog Error!"};
      ctrlSetText [1,"You are about to make an emergency call.<br />Note that you can only make 1 call every 10 minutes and that abuse is a criminal offense!\nThis call will cost you $200"];
      
      waitUntil{(not(ctrlVisible 1023)) || !(alive player)};
      if (Antwort == 2) then { _legit = false; } else { systemChat "Emergency call successfully sent."; }; Antwort = 2;
    } else {
      _legit = false;
      systemChat "You only can make 1 emergency call every 10 minutes.";
    };
  };
  prioCall = false;
  lastCall = time;
}; 

if(_legit) then {
	switch (_action) do {
		case "emergency": {
			if (alive _caller) then
			{
				_pos = position (_this select 1);
				_time = str(time);
				emMarkers = emMarkers + [_time];
				createMarkerLocal [_time, _pos];
				_time setMarkerTypeLocal "Warning";
				_time setMarkerTextLocal (format["EMERGENCY (%1)",name _caller]);
				_time setMarkerColorLocal "ColorRed";
				systemChat format["EMERGENCY CALL BY %1 - CHECK YOUR MAP",name _caller];
			};
		};
		case "call_cop": { (format["if (iscop) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player,""]) call toClients; };
		case "call_medic": { (format["if (ismedic) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
		case "call_un": { (format["if (isun) then { [""emergency"",%1] execVM ""armitxes\phone.sqf""; };",player]) call toClients; };
		case "vote": { if (iscop) then { [0,0,0,["chief"]] execVM "maindialogs.sqf"; } else { [0,0,0,["wahlen"]] execVM "maindialogs.sqf"; }; };
		case "sendSms": {
			 _to = _this select 2; _title = _this select 3; _msg = _this select 4;
			if(isNull "_caller") then { _by = "Anonymous"; };
			_pck = [false,_caller,name _to,_title,_msg,false];
			smsArray = smsArray + [ _pck ];
			[[["addSms",_pck],"phone.sqf"],"BIS_fnc_execVM",_to,false] call BIS_fnc_MP;
		};
		case "receiveSms": {
			_data = _caller;
			_caller = _data select 1;
			smsArray = smsArray + [ [true,_caller,name player,_data select 3,_data select 4, true] ];
			titleText ["YOU RECEIVED A NEW SMS","PLAIN"]; 
		};
	};
};