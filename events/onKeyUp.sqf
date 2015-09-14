private["_handled", "_key", "_shift", "_move"];

_key     = _this select 1;
_shift   = _this select 2;
_handled = true;

switch (_key) do {
	case 57: { if(speed (vehicle player) == 0) then { execVM "events\onMapInteraction.sqf"; }; };
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
	case 15: {if (_shift) then {1 call fnc_setHand;} else {2 call fnc_setHand;};};
	case 23: {INV_isOpen = true; ["icall"] execVM "gui\inventory.sqf";};
	case 33: {
		_vcl = vehicle player;
		if(PLAYERDATA select 7 in [1,2] && _vcl != player && driver _vcl == player) then { 
			[_plrInit,"BIS_fnc_call",true,false] call BIS_fnc_MP;
		};
	};
	case 38: {
		_vcl = (nearestobjects [getpos player, ["LandVehicle","Air","Ship"], 10]) select 0;
		if (_vcl in vclKeys) then {
			if(locked _vcl > 1) then {_vcl lock false;} else {
				_vcl lock true;
				playSound3D ["ArmiLife_Sounds\Vehicle\carlock.ogg",_vcl,false,position _vcl, 1, 1, 35];
			};
		};
	};
	default { _handled = false; };
};

_handled