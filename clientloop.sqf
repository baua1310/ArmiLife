while {true} do {
	if( !isNull (findDisplay 106) && !INV_isOpen ) then
	{
		(findDisplay 106) closeDisplay 1; sleep 0.1;
		hint "Nope! You are not allowed to grief on this server.";
	};
	if(player == vehicle player) then { ["spikes"] execVM "items\vehtools.sqf"; };
};