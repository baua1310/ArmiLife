enableSaving [false, false];
WEST setFriend [EAST, 1];
EAST setFriend [WEST, 1];
RESISTANCE setFriend [EAST, 1];
EAST setFriend [RESISTANCE, 1];
RESISTANCE setFriend [WEST, 1];
WEST setFriend [RESISTANCE, 1];
         
_w = execVM "masterarray.sqf";
waitUntil { scriptDone _w; };
_w = execVM "variables.sqf";
waitUntil { scriptDone _w; };
_w = execVM "_functions.sqf";
waitUntil { scriptDone _w; };

if(!isDedicated) then {
  //Stats loaded
  ["init"] execVM "gui\_controller.sqf";
  execVM "events\onRespawn.sqf";
  player addEventHandler ["respawn", { _this execVM "events\onRespawn.sqf"; }];
  onKeyDown = compile preprocessFile "events\onKeyDown.sqf";
  onKeyPress = compile preprocessFile "events\onKeyUp.sqf";
  setTerrainGrid 75;
  waituntil {!(IsNull (findDisplay 46))};
  (findDisplay 46) displaySetEventHandler ["KeyDown", "_this call onKeyDown"];
  (findDisplay 46) displaySetEventHandler ["KeyUp", "_this call onKeyPress"];
};