waitUntil { alive player; };
_plrInit = compile format["%1 setName '%2';", player, PLAYERDATA select 14];
[_plrInit,"BIS_fnc_spawn",true,true] call BIS_fnc_MP;