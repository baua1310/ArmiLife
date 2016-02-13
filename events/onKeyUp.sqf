private["_handled", "_key", "_shift", "_move"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = true;

switch (_key) do {
	case 57: { if (speed (vehicle player) == 0) then { execVM "events\onMapInteraction.sqf"; }; };
	case 3: {["inv"] execVM "gui\_controller.sqf";};
	case 4: {
		if((animationState player) in moveSurrender) then {
			player enableSimulation true;
			player switchMove "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";
		} else {
			[] spawn {
				player playMove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
				waitUntil {(animationState player) in moveSurrender};
				player enableSimulation false;
				waitUntil {simulationEnabled player || player getVariable "restrained"};
				player enableSimulation true; sleep 1;
				if (player getVariable "restrained") then { player playMove "AmovPercMstpSnonWnonDnon_Ease"; };
			};
		};
	};
	case 15: { if (_shift) then {1 call fnc_setHand;} else {2 call fnc_setHand;};};
	case 18: {
		_vehPlr = vehicle player;
		if (_vehPlr != player) then {
			if (locked _vehPlr != 2) then {
				if (speed _vehPlr < 10) then {  player action ["EJECT",_vehPlr];  } else { systemChat "Hell no, I'm not suiciding."; };
			} else { systemChat "Jumping out of a locked door? Really?" };
		} else {
			_pos = getPosATL player;
			_shops = nearestObjects [_pos,["Land_InfoStand_V1_F", "Land_InfoStand_V2_F"],2];
			if ((count _shops) > 0) then { ["openShop",_shops select 0] execVM "shops.sqf"; } else {
				_veh = _pos nearestObject "LandVehicle";
				if((vehicle player == player) && (player distance2D _veh < 4) && (locked _veh) == 0) then {
					if (_veh isKindOf "StaticWeapon") then { player moveInGunner _veh; } else {
						if(isNull (driver _veh)) then { player moveInDriver _veh; } else { player moveInCargo _veh; };
					};
				};
			};
		};
	};
	case 33: { ["switch"] execVM "events\onSiren.sqf"; };
	case 38: {
		_vcl = (nearestobjects [getpos player, ["LandVehicle","Air","Ship"], 10]) select 0;
		if (_vcl in vclKeys) then {
			if(locked _vcl > 1) then {_vcl lock false; titleText ["~ Vehicle unlocked ~","PLAIN DOWN",0.4]; } else {
				_vcl lock true;
				playSound3D ["ArmiLife_Sounds\Vehicle\carlock.ogg",_vcl,false,position _vcl, 1, 1, 35];
				titleText ["~ Vehicle locked ~","PLAIN DOWN",0.4];
			};
		};
	};
	default { _handled = false; };
};

_handled