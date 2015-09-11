_tool = _this select 0;
_vcl = (nearestobjects [getpos player, ["LandVehicle","Air","Ship"], 10]) select 0;

switch (_tool) do {
	case "spikes": {
		_vcl = vehicle player;
		_vcl setHit ["wheel_1_1_steering", 1];
		_vcl setHit ["wheel_2_1_steering", 1];
		_vcl setHit ["wheel_1_2_steering", 1];
		_vcl setHit ["wheel_2_2_steering", 1];
	};
	case "repair": {
		if(player != vehicle player) then { systemChat "I cant repair a vehicle from the inside ^^"; } else {
			if ((animationState player) in moveBusy) exitWith {systemChat "Wait, I am busy...";};
			if(player distance _vcl < 5) then {   
				_dam = damage _vcl;
				if(_dam >= 1) exitWith { systemChat "This vehicle is a mess, no chance I can repair it."; };
				[(_dam * 15 + 7),"Repairing...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
				if(player != vehicle player) exitWith { hint "You canceled the car repair"; };
				_vcl setDamage 0; systemChat "The vehicle looks like new.";
			} else { systemChat "What am I supposed to repair?"; };
		};
	};
	case "carjack": {
		if (isNil "_vcl") then {systemChat "There is no car here...";} else {
			if ((animationState player) in moveBusy) exitWith {systemChat "Wait, I am busy...";};
			systemChat "It works! Now I should slowly...";
			sleep 5;
		
			if (player distance _vcl < 10) then {
				_vcl setVectorUp [0.001,0.001,1.2];
				systemChat "I made it!";
			} else { systemChat "Damn, I slipped of! I should stay closer."; };		
		};
	};
	case "refuel": {                              
		if(player != vehicle player) then { systemChat "I must leave the vehicle to refuel it!"; } else {
			if ((animationState player) in moveBusy) exitWith {systemChat "Wait, I am busy...";};
			if(player distance _vcl < 5) then {   
				_fuel = fuel _vcl;
				if(_fuel > 0.95) exitWith { hint "This vehicle needs no refuel"; };
				_vcl lock true;
				[((1-_fuel) * 10 + 7),"Refueling...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
				_vcl setFuel 1;
			};
		};
	};
	case "lockpick": {
		if (!(isNull(_vcl))) then {
			if ((animationState player) in moveBusy) exitWith {systemChat "Wait, I am busy...";};
			if (_vcl in vclKeys) then { systemChat "Why should I lockpick this vehicle again?"; } else {
				[7,"Lockpicking...","AinvPknlMstpSnonWrflDnon_medic","AinvPknlMstpSnonWrflDnon_medicEnd"] spawn fnc_timer;
				if ((random 100) < 41) then {
					systemChat "I got this vehicle!";
					vclKeys = vclKeys + [_vcl];
				} else { systemChat "Damn this vehicle, I failed!"; };
				player removeItem "AL_lockpick";
				if (count (nearestObjects [player, ["Man"], 10]) > 0) then { [4000] call fnc_setBounty; hint format["You were seen lockpicking a vehicle!"]; };
			};
		} else { systemChat "There is nothing that I could lockpick..."; };
	};
};