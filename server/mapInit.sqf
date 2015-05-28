{
  _markerName = _x select 0;
  switch (_x select 1) do {
    case 1: { _markerName setMarkerColor "ColorWEST"; };
    case 2: { _markerName setMarkerColor "ColorEAST"; };
    case 3: { _markerName setMarkerColor "ColorGUER"; };
  };
} forEach capAreas;