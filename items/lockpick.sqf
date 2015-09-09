_vcls = nearestobjects [getpos player,["LandVehicle", "Air", "ship"], 7];
_closevcl = _vcls select 0;

if (!(isNull(_closevcl))) then {
	if ((animationState player) in moveBusy) exitWith {systemChat "Wait, I am busy...";};
	if (_closeVcl in vclKeys) then { systemChat "Why should I lockpick this vehicle again?"; } else {
		[7,"Lockpicking...","AinvPknlMstpSnonWrflDnon_medic","AmovPknlMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon"] spawn fnc_timer;
		if ((random 100) < 41) then {
			systemChat "I got this vehicle!";
			vclKeys = vclKeys + [_closevcl];
		} else { systemChat "Damn this vehicle, I failed!"; };
		player removeItem "AL_lockpick";
		if (count (nearestObjects [player, ["Man"], 10]) > 0) then { [4000] call fnc_setBounty; hint format["You were seen lockpicking a vehicle!"]; };
	};
} else { systemChat "There is nothing that I could lockpick..."; };