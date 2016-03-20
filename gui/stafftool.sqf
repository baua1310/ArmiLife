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
				if(!_dlgOpen) then { if (!(createDialog "moderatorTool")) exitWith {hint "Dialog Error!";}; _dlgOpen=true;};
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
				[["add","admin",_txt],"logs.sqf"] remoteExecCall ["BIS_fnc_execVM"];
			} else { systemChat "Message too short"; };
		};
		case "teamspeak": {
			_dsp = findDisplay 100;
			_ctrl = _dsp displayCtrl 2024;
			_sel = lbCurSel 2024;_txt = ctrlText 1400;
			
			_tar = true;
			_txt = "<t color='#FF0000'>~ Staff Message ~</t><br />All Police, EMS and Government members MUST be on TeamSpeak! ~ Connect to bbts3.com";
			[["add","admin",_txt],"logs.sqf"] remoteExecCall ["BIS_fnc_execVM"];
		};
		case "remoteCam": {
			_dsp = findDisplay 100;
			_ctrl = _dsp displayCtrl 2024;
			_sel = lbCurSel 2024;_txt = ctrlText 1400;
			_tar = _ctrl lbData _sel;

			if (_sel != -1 && _sel != 0) then {
				_tar = call compile _tar;
				remoteStaffCam_nvg = false;
				if (!(isNull remoteStaffCam)) then { adminCamOpen=false; sleep 2; };
				if (isNil "remoteStaffCam_y") then {
					_pos = getPos _tar;
					remoteStaffCam_x = (_pos select 0)-1;
					remoteStaffCam_z = (_pos select 1)-1;
					remoteStaffCam_y = 3;
					remoteStaffCam_fov = 1.1;
				};
				remoteStaffCam = "camera" camCreate (getPosATL _tar);

				adminCamOpen = true;
				_slider1 = 0;
				_slider2 = 0;

				remoteStaffCam cameraEffect ["internal", "back"];
				remoteStaffCam attachTo [_tar,[0,-3,2]];
				remoteStaffCam camSetFov remoteStaffCam_fov;
				remoteStaffCam camPreload 5;
				remoteStaffCam camSetTarget _tar;
				remoteStaffCam camCommit 0;

				while { adminCamOpen } do {
					sleep 1;
				};
				
				remoteStaffCam cameraEffect ["terminate","back"]; sleep 2;
				camDestroy remoteStaffCam;
				remoteStaffCam_nvg = false;
				remoteStaffCam_y = nil;
			} else { systemChat "Please select a player to spectate."; };
		};
		case "cleanServer": { { if (!alive _x) then { grpdel = group _x; deleteVehicle _x; deleteGroup grpdel; }; } forEach (nearestObjects [[15617,16069,0],["Man","Animal","Air","LandVehicle","Ship"], 9000]); };
		case "exe": {
			_code = ctrlText 2200;
			hintSilent _code;
		};
		case "tp": { allowTP = true; openMap true; };
	};
};