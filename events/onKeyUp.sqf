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
	default { _handled = false; };
};

_handled