waitUntil { alive player; };
/* (0) DBID, (1) [Cash,Bank], (2) Licenses, (3) Nation, (4) [Faction, Rank], (5) Bounty */
_pubPlrData = [
	PLAYERDATA select 0,
	[PLAYERDATA select 2,PLAYERDATA select 1],
	PLAYERDATA select 4,
	PLAYERDATA select 6,
	[PLAYERDATA select 7, PLAYERDATA select 8],
	PLAYERDATA select 9
];
player setVariable ["pubPlrData",_pubPlrData,true];
_plrInit = compile format["%1 setName '%2';", player, PLAYERDATA select 14];
[_plrInit,"BIS_fnc_spawn",true,true] call BIS_fnc_MP;