_action = _this select 3;
switch (_action) do {
	case "declare": {
		if (isNil "capWar") then {
			systemChat "IMPORTANT: Click in the mid of the Sector you want to attack.";
			openMap [true, true];
			onMapSingleClick "warCoords = _pos;";
			waitUntil {!isNil "warCoords"};
			openMap [false,false];

			_cap = nil; _capDist = 100000;
			for [{_i=0}, {_i<(count capAreas)}, {_i=_i+1}] do {
				_marker = (capAreas select _i) select 0;
				_dist = (getMarkerPos _marker) distance warCoords;
				if (_dist < _capDist) then {
					_cap = _i;
					_capDist = _dist;
				};
			};

			warCoords = nil;
			capWar = _cap;

			closeDialog 0;
			if (!(createDialog "YesNo")) exitWith {hint "Dialog Error!";};
			disableSerialization;
			_display = findDisplay 1000;
			_capData = (capAreas select capWar);
			(_display displayCtrl 1) ctrlSetText format ["Do you really want to declare %1 a warzone?",_capData select 0];
			antwort = 2;
			waitUntil {isNull(findDisplay 1000)};
			if (
				antwort == 2
				|| (_capData select 0) in ["capVikos","capKavala","capPyrgos"]
				|| (PLAYERDATA select 6) == (_capData select 1)
			) then {capWar = nil; systemChat "War declaration canceled";} else {
				systemChat "War declared!";
				(_capData select 0) setMarkerColor "ColorWhite";
				capFlag = "Flag_White_F" createVehicle (getMarkerPos (_capData select 0));
				[[[PLAYERDATA select 6,capWar,PLAYERDATA select 13,"declared",capFlag],"war.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
				switch (_capData select 1) do {
					case 0: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa"};
					case 1: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_nato_CO.paa";};
					case 2: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";};
					case 3: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa";};
				};
			};
		} else { systemChat "You can't declare war during a war."; };
	};
		
	case "declared": {
		_warTime = time + 3600;
		capWar = _this select 1;
		capFlag = _this select 4;
		_capData = (capAreas select capWar);
		_facName = (_capData select 1) call fnc_getNation;
		player say ["AL_Waralarm",1,1];
		_message = format ['<t color="#FF0000" size="1.2">- WAR DECLARATION -</t><br /><br />%2 of the %1 was declared a warzone by %3',_facName,_capData select 0,_this select 2];
		hint parseText _message;
		warWinner = nil;
		actionCapFlag = player addAction ["Capture Flag","war.sqf","claim",1,false,true,"","(player distance capFlag) < 5"];
		while { isNil "warWinner"; } do {
			sleep 60;
			_minutes = floor((_warTime - time)/60);
			_timeMSG = format ["%1<br /><br />%2 minutes until the war ends",_message,_minutes];
			hint parseText _timeMSG;
			if(time > _warTime) then {
				player removeAction actionCapFlag;
				if (isNil "warWinner") then {
					[[[nil,nil,nil,"end"],"war.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
					warWinner = true;
					_capData = (capAreas select capWar);
					switch (_capData select 1) do {
						case 0: {(_capData select 0) setMarkerColor "ColorWhite";};
						case 1: {(_capData select 0) setMarkerColor "ColorWEST";};
						case 2: {(_capData select 0) setMarkerColor "ColorEAST";};
						case 3: {(_capData select 0) setMarkerColor "ColorGUER";};
					};
				};		
			};
		};
	};

	case "claim": {
		if (isNil "warWinner") then {
			_playerFac = PLAYERDATA select 6;
			if (_playerFac != ((capAreas select capWar) select 1)) then {
				_w = [10,nil,"AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer;
				waitUntil { scriptDone _w; };
				if (alive player) then {
					switch (_playerFac) do {
							case 0: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_white_CO.paa"};
							case 1: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_nato_CO.paa";};
							case 2: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_CSAT_CO.paa";};
							case 3: {capFlag setFlagTexture "\A3\Data_F\Flags\Flag_FIA_CO.paa";};
					};						
					[[[_playerFac,capWar,name player,"updateStatus"],"war.sqf"],"BIS_fnc_execVM",true] call BIS_fnc_MP;
				};
			};
		} else { systemChat "Too late. The War is over."; };
	};

	case "updateStatus": {
		if (isNil "warWinner") then {
			capWar = _this select 1;
			_capData = (capAreas select capWar);
			_facOldName = (_capData select 1) call fnc_getNation;
			_capData set [1,_this select 0];
			capAreas set [capWar,_capData];
			_facNewName = (_capData select 1) call fnc_getNation;
			systemChat format ["!! %1 [ %2 ] is now claimed by %4 [ %3 ] !! but the war is not over.",_capData select 0,_facOldName,_facNewName,_this select 2];
		};
	};

	case "end": {
		warWinner = true;
		_capData = (capAreas select capWar);
		_facName = (_capData select 1) call fnc_getNation;
		_msg = format ['<t color="#00FF00" size="1.2">- WAR ENDED -</t><br /><br />%1 has successfully taken %2<br /><br />CONGRATULATIONS!',_facName,_capData select 0];
		hint parseText _msg;
		sleep 10;
		warWinner = nil; capWar = nil; deleteVehicle capFlag;
	};
};