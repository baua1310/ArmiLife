ciGlobal = radioChannelCreate [[0,191,255, 1], "Global", "[G] %UNIT_NAME", playerarray];
ciSide = radioChannelCreate [[0,191,255, 1], "Side", "[S] %UNIT_NAME", playerarray];
ciCop = radioChannelCreate [[0,191,255, 1], "Cop", "[C] %UNIT_NAME", playerarray];
ciUN = radioChannelCreate [[0,191,255, 1], "UN", "[U] %UNIT_NAME", playerarray];

{
	_markerName = _x select 0;
	switch (_x select 1) do {
		case 1: { _markerName setMarkerColor "ColorWEST"; };
		case 2: { _markerName setMarkerColor "ColorEAST"; };
		case 3: { _markerName setMarkerColor "ColorGUER"; };
	};
} forEach capAreas;