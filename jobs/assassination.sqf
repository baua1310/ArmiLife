_viptargets = missionNamespace getVariable "viptargets";
if (!(isNil "_viptargets")) then {
	_veh = "B_G_Offroad_01_armed_F" createVehicle (getPos player);
	_crew = crew _veh;
	_vip = gunner _veh;
	missionNamespace setVariable ["viptargets",_crew,true];
	while (alive player && alive _vip) do {
		
	};
} else { systemChat "Well, seems like someone is doing my job already."; };

