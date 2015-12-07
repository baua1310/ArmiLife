[] spawn {
	private ["_f"];
	while { true } do {
		_f = false;
		if (curCap select 0 != "Borderline") then { while { ([player,curCap select 0] call fnc_isInMarker) } do { sleep 5; }; };
		{ if( ([player,_x select 0] call fnc_isInMarker) ) exitWith { curCap = _x; _f = true; }; } forEach capAreas;
		if (!_f) then { curCap = ["Borderline",0,100]; };
		call fnc_updateCurCap;
		sleep 5;
	};
};

while {true} do {
	_vclPlr = vehicle player;
	if( !isNull (findDisplay 106) && !INV_isOpen ) then
	{
		(findDisplay 106) closeDisplay 1; sleep 0.1;
		hint "Nope! You are not allowed to grief on this server.";
	};

	if(!(player == _vclPlr)) then {
		_nextspike = (getPos player) nearestObject "Land_Razorwire_F";
		if((_vclPlr distance _nextspike) < 5 && _vclPlr != player) then { ["spikes"] execVM "items\vehtools.sqf"; };
	};
};